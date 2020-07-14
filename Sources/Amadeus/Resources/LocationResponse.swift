import Foundation

public struct LocationResponse: Codable {
    let data: LocationData
}

public struct LocationsResponse: Codable {
    let data: [LocationData]
}

struct LocationData: Codable {
    let type: String
    let subType: String
    let name, detailedName, id: String
    let datumSelf: SelfClass
    let timeZoneOffset, iataCode: String
    let geoCode: GeoCode
    let address: Address
    let analytics: AnalyticsTravel?

    enum CodingKeys: String, CodingKey {
        case type, subType, name, detailedName, id
        case datumSelf = "self"
        case timeZoneOffset, iataCode, geoCode, address, analytics
    }
}

struct Address: Codable {
    let cityName, cityCode: String
    let countryName: String
    let countryCode: String
    let regionCode: String
    let stateCode: String?
}
struct AnalyticsTravel: Codable {
    let travelers: Travelers
}

struct Travelers: Codable {
    let score: Int
}

struct SelfClass: Codable {
    let href: String
    let methods: [String]
}

enum Method: String, Codable {
    case methodGET = "GET"
}

struct GeoCode: Codable {
    let latitude, longitude: Double
}
