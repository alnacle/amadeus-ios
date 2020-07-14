import Foundation

public typealias AmadeusParameter = [String:Any]
public typealias AmadeusResponse<APIResponse> = (Result<APIResponse, Error>) -> Void

public class Client {
    
    public var configuration: Configuration
    private var accessToken: AccessToken
    
    public init(config: Configuration) {
        self.configuration = config
        self.accessToken = AccessToken()
    }
    
    private func getAuthToken(onCompletion: @escaping (Result<String, Error>) -> ()) {
        print(accessToken.token())
        if self.accessToken.needRefresh() {
            var tokenRequest = AccessTokenRequest()
            
            tokenRequest.body = self.accessToken.getBody(client_id: self.configuration.client_id,
                                                         client_secret: self.configuration.client_secret)
            
            let headers = ["Content-Type": "application/x-www-form-urlencoded"]
            
            self.send(tokenRequest, headers: headers) { (result) in
                switch result {
                case .success(let token):
                    self.accessToken.updateToken(token: token.accessToken)
                    onCompletion(.success(token.accessToken))
                case .failure(let error):
                    onCompletion(.failure(error))
                }
            }
        } else {
            onCompletion(.success(self.accessToken.token()))
        }
    }
    
    public func auth_send<T: APIRequest>(_ request: T,
                                         onCompletion: @escaping AmadeusResponse<T.Response>) {
        self.getAuthToken() { (result) in
            switch result {
            case .success(let token):
                self.send(request, headers: ["Authorization": "Bearer \(token)"], onCompletion: { result in
                    onCompletion(result)
                })
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
    
    public func send<T: APIRequest>(_ request: T,
                                    headers: [String:String],
                                    onCompletion: @escaping AmadeusResponse<T.Response>) {
                
        var urlComponents = URLComponents()
        
        urlComponents.scheme = configuration.scheme
        urlComponents.host = configuration.host
        urlComponents.path = request.resource
        
        if let p = request.parameters {
            urlComponents.queryItems = p.map({ (arg) -> URLQueryItem in
                let (key, value) = arg
                return URLQueryItem(name: key, value: String(describing: value))
            
            })
        }
                
        guard let url = urlComponents.url else {
            onCompletion(.failure(APIError.invalidEndpoint))
            return
        }
        
        var urlRequest = URLRequest(url: url)
                
        urlRequest.httpBody = request.body
        urlRequest.httpMethod = request.method
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue(configuration.customAppId, forHTTPHeaderField: "User-Agent")

        for header in headers {
            urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        if configuration.logLevel == LogLevel.VERBOSE {
            print(urlRequest.httpMethod!)
            print(urlRequest)
            print(urlRequest.allHTTPHeaderFields!)
            print(String(decoding: urlRequest.httpBody ?? "".data(using: .utf8)!, as: UTF8.self))
        }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                let error = error ?? APIError.unknown
                onCompletion(.failure(error))
                return
            }
            
            if let httpResp = response as? HTTPURLResponse {
                let code = httpResp.statusCode
                
                if self.configuration.logLevel == LogLevel.VERBOSE {
                    print("[HTTP]", code, String(data: data ?? Data(), encoding: .utf8) ?? "--")
                }
            
                switch code {
                case 400:
                    return onCompletion(.failure(APIError.badRequest))
                case 401:
                    return onCompletion(.failure(APIError.authenticationError))
                case 404:
                    return onCompletion(.failure(APIError.notFound))
                case 429:
                    return onCompletion(.failure(APIError.tooManyRequests))
                case 500:
                    return onCompletion(.failure(APIError.serverError))
                default:
                    break
                }
            }
            
            guard let data = data else {
                onCompletion(.failure(APIError.noData))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let decoded = try decoder.decode(T.Response.self, from: data)
                onCompletion(.success(decoded))
            } catch DecodingError.dataCorrupted(let context) {
                print(context.debugDescription)
                onCompletion(.failure(APIError.decodingError(context.debugDescription)))
            } catch DecodingError.keyNotFound(let key, let context) {
                print("\(key.stringValue) was not found, \(context.debugDescription)")
                onCompletion(.failure(APIError.decodingError("\(key.stringValue) was not found")))
            } catch DecodingError.typeMismatch(let type, let context) {
                print("\(type) was expected, \(context.debugDescription)")
                onCompletion(.failure(APIError.decodingError("\(type) was expected")))
            } catch DecodingError.valueNotFound(let type, let context) {
                print("no value was found for \(type), \(context.debugDescription)")
                onCompletion(.failure(APIError.decodingError("no value was found for \(type)")))
            } catch {
                onCompletion(.failure(error))
            }
        }.resume()
    }
}

