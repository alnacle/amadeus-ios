import Foundation

public struct TripPurpose {
    private var client: Client
    
    public init(client: Client) {
        self.client = client
    }

    /*
    public func get(params: [String: String], onCompletion: @escaping AmadeusResponse) {
        client.get(path: "v1/travel/predictions/trip-purpose", params: params, onCompletion: {
            result in
            onCompletion(result)
        })
    }*/
}
