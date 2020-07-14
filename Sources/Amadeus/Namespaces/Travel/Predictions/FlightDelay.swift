import Foundation

private struct FlightDelayPredictionRequest: APIRequest {
    
    public typealias Response = FlightDelayPredictionResponse
    
    public var method = "GET"
    public var resource = "/v1/travel/predictions/flight-delay"
    public var body: Data? = nil
    public var parameters: [String:Any]? = nil
}

public struct FlightDelay {
    private var client: Client
    
    public init(client: Client) {
        self.client = client
    }
    
    public func get(parameters: AmadeusParameter, onCompletion: @escaping AmadeusResponse<FlightDelayPredictionResponse>) {
        var request = FlightDelayPredictionRequest()
        request.parameters = parameters
        client.auth_send(request, onCompletion: {
            result in
            onCompletion(result)
        })
    }
}
