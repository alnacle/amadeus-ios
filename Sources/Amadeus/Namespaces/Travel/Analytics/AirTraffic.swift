import Foundation

public struct AirTraffic {
    public let traveled: Traveled
    public let booked: Booked
    public let busiestPeriod: BusiestPeriod

    public init(client: Client) {
        traveled = Traveled(client: client)
        booked = Booked(client: client)
        busiestPeriod = BusiestPeriod(client: client)
    }
}
