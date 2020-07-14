import Foundation

public struct Dictionaries: Codable {
    let locations: [String: FlightLocation]?
    let aircraft: [String: String]?
    let currencies: [String: String]?
    let carriers: [String: String]?
}

struct FlightLocation: Codable {
    let cityCode: String?
    let countryCode: String?
    let subType: String?
    let detailedName: String?
}

