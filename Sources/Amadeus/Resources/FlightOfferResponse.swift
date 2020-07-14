import Foundation

public struct FlightOfferResponse: Codable {
    let meta: Meta?
    let data: [FlightOffer]
    //let dictionaries: Dictionaries?
}

public struct FlightOffer: Codable {
    let choiceProbability: String?
    let type, id, source: String
    let instantTicketingRequired, nonHomogeneous, oneWay: Bool
    let lastTicketingDate: String
    let numberOfBookableSeats: Int
    let itineraries: [Itinerary]
    let price: DatumPrice
    let pricingOptions: PricingOptions
    let validatingAirlineCodes: [String]
    let travelerPricings: [TravelerPricing]
}

struct Itinerary: Codable {
    let duration: String
    let segments: [Segment]
}

struct Segment: Codable {
    let departure, arrival: Arrival
    let carrierCode, number: String
    let aircraft: SegmentAircraft
    let operating: Operating?
    let duration, id: String 
    let numberOfStops: Int
    let blacklistedInEU: Bool
}

struct SegmentAircraft: Codable {
    let code: String
}

struct Arrival: Codable {
    let iataCode: String
    let at: String
    let terminal: String?
}

struct Operating: Codable {
    let carrierCode: String
}

struct DatumPrice: Codable {
    let currency, total, base: String
    let fees: [AdditionalService]
    let grandTotal: String
    let additionalServices: [AdditionalService]?
}

struct AdditionalService: Codable {
    let amount, type: String
}

struct PricingOptions: Codable {
    let fareType: [String]
    let includedCheckedBagsOnly: Bool?
}

struct TravelerPricing: Codable {
    let travelerID, fareOption, travelerType: String
    let price: TravelerPricingPrice
    let fareDetailsBySegment: [FareDetailsBySegment]

    enum CodingKeys: String, CodingKey {
        case travelerID = "travelerId"
        case fareOption, travelerType, price, fareDetailsBySegment
    }
}

struct FareDetailsBySegment: Codable {
    let segmentID: String
    let cabin: String
    let fareBasis: String
    let brandedFare: String?
    let fareDetailsBySegmentClass: String
    let includedCheckedBags: IncludedCheckedBags

    enum CodingKeys: String, CodingKey {
        case segmentID = "segmentId"
        case cabin, fareBasis, brandedFare
        case fareDetailsBySegmentClass = "class"
        case includedCheckedBags
    }
}

struct IncludedCheckedBags: Codable {
    let quantity, weight: Int?
    let weightUnit: String?
}


struct TravelerPricingPrice: Codable {
    let currency, total, base: String
}

