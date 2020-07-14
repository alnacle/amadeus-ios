import Foundation

public struct PointOfInterest {
    private let client: Client
    private let poiId: String
    
    public init(client: Client, poiId: String) {
        self.client = client
        self.poiId = poiId
    }
    
    /*
    public func get(onCompletion: @escaping AmadeusResponse) {
        client.get(path: "v1/reference-data/locations/pois/\(poiId)", params: [:], onCompletion: {
            result in
            onCompletion(result)
        })
    }*/
}
