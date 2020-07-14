import Foundation

private struct CheckinLinkRequest: APIRequest {
    
    public typealias Response = CheckinLinkResponse
    
    public var method = "GET"
    public var resource = "/v2/reference-data/urls/checkin-links"
    public var body: Data? = nil
    public var parameters: [String:Any]? = nil
}


public struct CheckinLinks {
    private var client: Client
    
    public init(client: Client) {
        self.client = client
    }
    
    public func get(parameters: AmadeusParameter, onCompletion: @escaping AmadeusResponse<CheckinLinkResponse>) {
        var request = CheckinLinkRequest()
        request.parameters = parameters
        client.auth_send(request, onCompletion: {
            result in
            onCompletion(result)
        })
    }
}
