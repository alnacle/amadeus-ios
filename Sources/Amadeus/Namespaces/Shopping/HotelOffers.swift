import Foundation

private struct HotelSearchRequest: APIRequest {
    
    public typealias Response = HotelSearchResponse
    
    public var method = "GET"
    public var resource = "/v2/shopping/hotel-offers"
    public var body: Data? = nil
    public var parameters: [String:Any]? = nil
}

public struct HotelOffers {
    private var client: Client
    
    public init(client: Client) {
        self.client = client
    }
    
    public func get(parameters: AmadeusParameter, onCompletion: @escaping AmadeusResponse<HotelSearchResponse>) {
        var request = HotelSearchRequest()
        request.parameters = parameters
        client.auth_send(request, onCompletion: {
            result in
            onCompletion(result)
        })
    }
}
