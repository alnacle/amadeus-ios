import Foundation

private struct FlightChoicePredictionRequest: APIRequest {
    
    public typealias Response = FlightOfferResponse
    
    public var method = "POST"
    public var resource = "/v2/shopping/flight-offers/prediction"
    public var body: Data? = nil
    public var parameters: [String:Any]? = nil
}

public struct Prediction {
    
    private struct PredictionOfferRequest: Codable {
        let data: [FlightOffer]
    }
    
    private var client: Client
    
    public init(client: Client) {
        self.client = client
    }

    public func post(flightOffers: [FlightOffer], onCompletion: @escaping AmadeusResponse<FlightOfferResponse>) {
        
        do {
            let offers = PredictionOfferRequest(data: flightOffers)
            var request = FlightChoicePredictionRequest()
            
            let jsonData = try JSONEncoder().encode(offers)
            request.body = jsonData
            
            client.auth_send(request, onCompletion: {
                result in
                onCompletion(result)
            })
            
        } catch { print(error) }
    }
}
