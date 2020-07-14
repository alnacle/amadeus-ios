import Foundation

public struct EReputation {
    public let hotelSentiments: HotelSentiments

    public init(client: Client) {
        hotelSentiments = HotelSentiments(client: client)
    }
}
