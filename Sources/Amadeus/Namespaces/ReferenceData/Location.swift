import Foundation

private struct LocationRequest: APIRequest {

    public typealias Response = LocationResponse
    
    public var method = "GET"
    public var resource = "/v1/reference-data/locations"
    public var body: Data? = nil
    public var parameters: [String:Any]? = nil
}

public struct Location {

    private let client: Client
    private let locationId: String

    
    public init(client: Client, locationId: String) {
        self.client = client
        self.locationId = locationId
    }

    public func get(onCompletion: @escaping AmadeusResponse<LocationResponse>) {
        var request = LocationRequest()
        
        request.resource += "/" + self.locationId
        
        client.auth_send(request, onCompletion: {
            result in
            onCompletion(result)
        })
    }
}

