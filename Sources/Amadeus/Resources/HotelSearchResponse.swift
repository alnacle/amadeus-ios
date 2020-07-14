import Foundation

public struct HotelSearchResponse: Codable {
    let data: [HotelSearchData]
    //let meta: Meta
}

struct HotelSearchData: Codable {
    let type: String
    let hotel: Hotel
    let available: Bool
    let offers: [Offer]
    let datumSelf: String

    enum CodingKeys: String, CodingKey {
        case type, hotel, available, offers
        case datumSelf = "self"
    }
}

struct Hotel: Codable {
    let type: String
    let hotelID, chainCode, dupeID, name: String
    let rating: String
    let cityCode: String
    let latitude, longitude: Double
    let hotelDistance: HotelDistance
    let address: HotelAddress
    let contact: Contact
    let hotelDescription: HotelDescription?
    let amenities: [String]
    let media: [HotelMedia]?

    enum CodingKeys: String, CodingKey {
        case type
        case hotelID = "hotelId"
        case chainCode
        case dupeID = "dupeId"
        case name, rating, cityCode, latitude, longitude, hotelDistance, address, contact
        case hotelDescription = "description"
        case amenities, media
    }
}

struct HotelAddress: Codable {
    let lines: [String]
    let postalCode: String
    let cityName: String
    let countryCode: String
}

struct Contact: Codable {
    let phone, fax: String
    let email: String?
}

struct HotelDescription: Codable {
    let lang: String
    let text: String
}

struct HotelDistance: Codable {
    let distance: Double
    let distanceUnit: String
}

struct HotelMedia: Codable {
    let uri: String
    let category: String
}


struct Offer: Codable {
    let id, checkInDate, checkOutDate, rateCode: String
    let commission: Commission?
    let room: Room
    let guests: Guests
    let price: HotelPrice
    let policies: Policies
    let rateFamilyEstimated: RateFamilyEstimated?
    let boardType: String?
}

struct Commission: Codable {
    let percentage: String
}

struct Guests: Codable {
    let adults: Int
}

struct Policies: Codable {
    let deposit: Deposit?
    let paymentType: String
    let cancellation: Cancellation?
    let holdTime: HoldTime?
    let guarantee: Deposit?
}

struct Cancellation: Codable {
    let deadline: String
    let numberOfNights: Int?
}

struct Deposit: Codable {
    let acceptedPayments: AcceptedPayments
}

struct AcceptedPayments: Codable {
    let creditCards: [String]?
    let methods: [String]
}

struct HoldTime: Codable {
    let deadline: String
}

struct HotelPrice: Codable {
    let currency: String
    let total: String
    let variations: Variations
    let base: String?
}

struct Variations: Codable {
    let average: Average?
    let changes: [Change]
}

struct Average: Codable {
    let base, total: String?
}

struct Change: Codable {
    let startDate, endDate: String
    let total, base: String?
}

struct RateFamilyEstimated: Codable {
    let code, type: String
}

struct Room: Codable {
    let type: String
    let typeEstimated: TypeEstimated?
    let roomDescription: HotelDescription

    enum CodingKeys: String, CodingKey {
        case type, typeEstimated
        case roomDescription = "description"
    }
}

struct TypeEstimated: Codable {
    let category: String
    let beds: Int?
    let bedType: String?
}

