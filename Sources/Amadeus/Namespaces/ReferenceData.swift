import Foundation

public struct ReferenceData {
    public let airLines: AirLines
    public let urls: Urls
    public let locations: Locations
    private let client: Client

    public init(client: Client) {
        self.client = client
        self.airLines = AirLines(client: client)
        self.urls = Urls(client: client)
        self.locations = Locations(client: client)
    }

    public func location(locationId: String) -> Location {
        return Location(client: client, locationId: locationId)
    }
}
