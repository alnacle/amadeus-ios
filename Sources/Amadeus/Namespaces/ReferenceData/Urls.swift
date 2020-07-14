import Foundation

public struct Urls {
    public let checkinLinks: CheckinLinks

    public init(client: Client) {
        checkinLinks = CheckinLinks(client: client)
    }
}
