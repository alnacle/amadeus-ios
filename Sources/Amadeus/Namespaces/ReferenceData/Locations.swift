import Foundation

private struct LocationRequest: APIRequest {

    public typealias Response = LocationsResponse
    
    public var method = "GET"
    public var resource = "/v1/reference-data/locations"
    public var body: Data? = nil
    public var parameters: [String:Any]? = nil
}

public struct Locations {
    private let client: Client
    
    public let airports: Airports
    public let pointsOfInterest: PointsOfInterest
    
    public init(client: Client) {
        self.client = client
        airports = Airports(client: client)
        pointsOfInterest = PointsOfInterest(client: client)
    }
    
    public func pointOfInterest(poiId: String) -> PointOfInterest {
        return PointOfInterest(client: client, poiId: poiId)
    }
    
    public func get(parameters: AmadeusParameter, onCompletion: @escaping AmadeusResponse<LocationsResponse>) {
        var request = LocationRequest()
        request.parameters = parameters
        client.auth_send(request, onCompletion: {
            result in
            onCompletion(result)
        })
    }
}
