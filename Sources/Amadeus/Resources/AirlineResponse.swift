import Foundation

public struct AirlineResponse: Codable {
    let data: [AirlineData]
}

struct AirlineData: Codable {
    let type, iataCode, icaoCode, businessName: String
    let commonName: String
}
