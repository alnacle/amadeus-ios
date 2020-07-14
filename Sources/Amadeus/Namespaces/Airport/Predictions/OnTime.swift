import Foundation

private struct AirportPredictionRequest: APIRequest {
    
    public typealias Response = AirportPredictionResponse
    
    public var method = "GET"
    public var resource = "/v1/airport/predictions/on-time"
    public var body: Data? = nil
    public var parameters: [String:Any]? = nil
}

public struct OnTime{
    private var client: Client
    
    public init(client: Client) {
        self.client = client
    }

    public func get(parameters: AmadeusParameter, onCompletion: @escaping AmadeusResponse<AirportPredictionResponse>) {
        var request = AirportPredictionRequest()
        request.parameters = parameters
        client.auth_send(request, onCompletion: {
            result in
            onCompletion(result)
        })
    }
}
