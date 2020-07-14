import Foundation

public struct PointsOfInterest {
    private let client: Client
    public var bySquare: BySquare
    
    public init(client: Client) {
        self.client = client
        bySquare = BySquare(client: client)
    }
    
    /*
    public func get(params: [String: String], onCompletion: @escaping AmadeusResponse) {
        client.get(path: "v1/reference-data/locations/pois", params: params, onCompletion: {
            result in
            onCompletion(result)
        })
    }*/
}
