import Foundation

public struct Media {
    public let files: Files

    public init(client: Client) {
        files = Files(client: client)
    }
}
