import Foundation

public struct FlightOffersPrice {
    private var client: Client
    
    public init(client: Client) {
        self.client = client
    }
    
    /*
    public func post(body: AnyObject, params: [String: String] = [:], onCompletion: @escaping AmadeusResponse) {
        
        
        var flightOffers: AnyObject = body
        
        if body.arrayValue.count == 0 {
            flightOffers = [body]
        }
        
        let pricing: JSON = [ "data": [ "type": "flight-offers-pricing", "flightOffers": flightOffers] ]
        
        client.post(path: "/v1/shopping/flight-offers/pricing",
                    body: pricing,
                    params: params,
                    onCompletion: {
                        result in
                        onCompletion(result)
        })
    }*/
}
