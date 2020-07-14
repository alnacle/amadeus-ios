import Foundation

public struct Booked {
    private var client: Client
    
    public init(client: Client) {
        self.client = client
    }
    
    /*
    public func get(params: [String: String], onCompletion: @escaping AmadeusResponse) {
        client.get(path: "v1/travel/analytics/air-traffic/booked", params: params, onCompletion: {
            result in
            onCompletion(result)
        })
    }*/
}
