import Foundation

public struct FlightDestinationsResponse: Codable {
    let data: [FlightDestinationData]
    //let dictionaries: Dictionaries?
    //let meta: Meta?
}

struct FlightDestinationData: Codable {
    let type: String
    let origin: String
    let destination, departureDate, returnDate: String
    let price: Price
    let links: DatumLinks
}

struct DatumLinks: Codable {
    let flightDates, flightOffers: String
}

struct Price: Codable {
    let total: String
}
