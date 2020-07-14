import Foundation

private struct FlightOfferRequest: APIRequest {
    
    public typealias Response = FlightOfferResponse
    
    public var method = "GET"
    public var resource = "/v2/shopping/flight-offers"
    public var body: Data? = nil
    public var parameters: [String:Any]? = nil
}

public struct FlightOffersSearch {
    
    private var client: Client
    
    public init(client: Client) {
        self.client = client
    }
    
    public func get(parameters: AmadeusParameter, onCompletion: @escaping AmadeusResponse<FlightOfferResponse>) {
        var request = FlightOfferRequest()
        request.parameters = parameters
        client.auth_send(request, onCompletion: {
            result in
            onCompletion(result)
        })
    }
    
    /*
   public func post(body: AnyObject, onCompletion: @escaping AmadeusResponse) {
        client.post(path: "/v2/shopping/flight-offers", body: body, params: [:], onCompletion: {
            result in
            onCompletion(result)
        })
    }*/
}
