import Foundation

public struct HotelOffer {
    private var client: Client
    private var hotelId: String
    
    public init(client: Client, hotelId: String) {
        self.client = client
        self.hotelId = hotelId
    }
    
    /*
    public func get(onCompletion: @escaping AmadeusResponse) {
        client.get(path: "v2/shopping/hotel-offers/\(hotelId)", params: [:], onCompletion: { result in
            onCompletion(result)
        })
    }*/
}
