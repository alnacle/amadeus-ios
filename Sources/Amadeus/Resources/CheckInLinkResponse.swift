import Foundation

public struct CheckinLinkResponse: Codable {
    let data: [CheckinLinksData]
}

struct CheckinLinksData: Codable {
    let type, id: String
    let href: String
    let channel: String
    let parameters: Parameters?
}

struct Parameters: Codable {
    let last: Last
    let pnr: Pnr

    enum CodingKeys: String, CodingKey {
        case last = "LAST"
        case pnr = "PNR"
    }
}

struct Last: Codable {
    let lastDescription, type: String

    enum CodingKeys: String, CodingKey {
        case lastDescription = "description"
        case type
    }
}

struct Pnr: Codable {
    let pnrDescription, type, format: String

    enum CodingKeys: String, CodingKey {
        case pnrDescription = "description"
        case type, format
    }
}
