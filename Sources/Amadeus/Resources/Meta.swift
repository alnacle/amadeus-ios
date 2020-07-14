import Foundation

public struct Meta: Codable {
    let count: Int
    let links: Links
}

struct Links: Codable {
    let linksSelf: String?
    let next: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case next
    }
}
