import Foundation

public struct FlightOffers {
    public let pricing: FlightOffersPrice
    public let prediction: Prediction

    public init(client: Client) {
        pricing = FlightOffersPrice(client: client)
        prediction = Prediction(client: client)
    }
}

