import Foundation

public struct Booking {
    private let client: Client
    public let flightOrders: FlightOrders
    public let hotelBookings: HotelBookings

    public init(client: Client) {
        self.client = client
        flightOrders = FlightOrders(client: client)
        hotelBookings = HotelBookings(client: client)
    }

    public func flightOrder(flightOrderId: String) -> FlightOrder{
        return FlightOrder(client: self.client, flightOrderId: flightOrderId)
    }
}
