import Foundation

private struct AirlineRequest: APIRequest {
    
    public typealias Response = AirlineResponse
    
    public var method = "GET"
    public var resource = "/v1/reference-data/airlines"
    public var body: Data? = nil
    public var parameters: [String:Any]? = nil
}

public struct AirLines {

    private let client: Client
    
    public init(client: Client) {
        self.client = client
    }

    public func get(parameters: AmadeusParameter, onCompletion: @escaping AmadeusResponse<AirlineResponse>) {
        var request = AirlineRequest()
        request.parameters = parameters
        client.auth_send(request, onCompletion: {
            result in
            onCompletion(result)
        })
    }
}
