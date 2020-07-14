import Foundation

private struct FlightDestinationsRequest: APIRequest {
    
    public typealias Response = FlightDestinationsResponse
    
    public var method = "GET"
    public var resource = "/v1/shopping/flight-destinations"
    public var body: Data? = nil
    public var parameters: [String:Any]? = nil
}

public struct FlightDestinations {
    private var client: Client
    
    public init(client: Client) {
        self.client = client
    }
    
    public func get(parameters: AmadeusParameter, onCompletion: @escaping AmadeusResponse<FlightDestinationsResponse>) {
        var request = FlightDestinationsRequest()
        request.parameters = parameters
        client.auth_send(request, onCompletion: {
            result in
            onCompletion(result)
        })
    }
}
