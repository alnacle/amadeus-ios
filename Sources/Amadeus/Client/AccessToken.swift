import Foundation

public struct AccessTokenRequest: APIRequest {
    public typealias Response = AccessTokenResponse

    public var method = "POST"
    public var resource = "/v1/security/oauth2/token"
    public var body: Data? = nil
    public var parameters: [String:Any]? = nil
}


public struct AccessTokenResponse: Codable {
    let type, username, applicationName, clientID: String
    let tokenType, accessToken: String
    let expiresIn: Int
    let state, scope: String

    enum CodingKeys: String, CodingKey {
        case type, username
        case applicationName = "application_name"
        case clientID = "client_id"
        case tokenType = "token_type"
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case state, scope
    }
}

public struct AccessToken {
    private var access_token: String = ""
    private var expires_time: Int = 0
        
    public func needRefresh() -> Bool {
        return (access_token == "" || Int(Date().timeIntervalSince1970 * 1000) > expires_time)
    }
    
    public func getBody(client_id: String, client_secret: String) -> Data {
        return "grant_type=client_credentials&client_id=\(client_id)&client_secret=\(client_secret)".data(using: .utf8)!
    }
    
    public mutating func updateToken(token: String) {
        access_token = token
        expires_time = self.expires_time * 1000 + Int(Date().timeIntervalSince1970 * 1000)
    }
    
    public func token() -> String {
        return access_token
    }
}
