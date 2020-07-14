import Foundation

public struct Analytics {
    public let airTraffic: AirTraffic

    public init(client: Client) {
        airTraffic = AirTraffic(client: client)
    }
}
