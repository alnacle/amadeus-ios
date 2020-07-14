import Foundation

public class Amadeus {
    public var client: Client
    public let shopping: Shopping
    public let booking: Booking
    public let airport: Airport
    public let travel: Travel
    public let media: Media
    public let eReputation: EReputation
    public let referenceData: ReferenceData
    
    public convenience init() {
        let client_id = ProcessInfo.processInfo.environment["AMADEUS_CLIENT_ID"] ?? ""
        let client_secret = ProcessInfo.processInfo.environment["AMADEUS_CLIENT_SECRET"] ?? ""
        
        self.init(client_id: client_id, client_secret: client_secret)
    }
    
    public convenience init(client_id: String, client_secret: String) {
        
        var config = Configuration()
        
        config.client_id = client_id
        config.client_secret = client_secret
        
        self.init(configuration: config)
    }
    
    public init(configuration: Configuration) {
                        
        client = Client(config: configuration)
        
        shopping = Shopping(client: client)
        booking = Booking(client: client)
        airport = Airport(client: client)
        travel = Travel(client: client)
        media = Media(client: client)
        eReputation = EReputation(client: client)
        referenceData = ReferenceData(client: client)
    }
    
    /*
    
    private func getComponentsFromURL(response: Response, keyword: String) -> (path: String, params: [String: String]) {
        //response.result["meta"]["links"][keyword] as? String
        if let nextURL = response.result["meta"] as? String {
            let url = URL(string: nextURL)
            
            var dict = [String: String]()
            let components = URLComponents(url: url!, resolvingAgainstBaseURL: false)!
            
            if let queryItems = components.queryItems {
                for item in queryItems {
                    dict[item.name] = item.value!
                }
            }
            return (components.path, dict)
        } else {
            return ("error", [:])
        }
    }
    
    public func next(response: Response, onCompletion: @escaping AmadeusResponse) {
        let (path, params) = getComponentsFromURL(response: response, keyword: "next")
        
        guard path != "error" else { onCompletion(.failure(.badRequestError("Error"))); return }
        
        client.get(path: path, params: params, onCompletion: { result in
            onCompletion(result)
        })
    }
    
    public func previous(response: Response, onCompletion: @escaping AmadeusResponse) {
        let (path, params) = getComponentsFromURL(response: response, keyword: "previous")
        
        guard path != "error" else { onCompletion(.failure(.badRequestError("Error"))); return }
        
        client.get(path: path, params: params, onCompletion: { result in
            onCompletion(result)
        })
    }
    
    public func last(response: Response, onCompletion: @escaping AmadeusResponse) {
        let (path, params) = getComponentsFromURL(response: response, keyword: "last")
        
        guard path != "error" else { onCompletion(.failure(.badRequestError("Error"))); return }
        
        client.get(path: path, params: params, onCompletion: { result in
            onCompletion(result)
        })
    }
    
    public func first(response: Response, onCompletion: @escaping AmadeusResponse) {
        let (path, params) = getComponentsFromURL(response: response, keyword: "last")
        
        guard path != "error" else { onCompletion(.failure(.badRequestError("Error"))); return }
        
        client.get(path: path, params: params, onCompletion: { result in
            onCompletion(result)
        })
    }*/
}
