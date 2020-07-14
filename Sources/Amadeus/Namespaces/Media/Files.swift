import Foundation

public struct Files {
    public let generatedPhotos: GeneratedPhotos

    public init(client: Client) {
        generatedPhotos = GeneratedPhotos(client: client)
    }
}
