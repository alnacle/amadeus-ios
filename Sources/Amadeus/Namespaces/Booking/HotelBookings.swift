import Foundation

public struct HotelBookings {
    private var client: Client
    
    public init(client: Client) {
        self.client = client
    }
    
    /*
    public func post(body: AnyObject, params: [String: String] = [:], onCompletion: @escaping AmadeusResponse) {
        
        client.post(path: "/v1/booking/hotel-bookings", body: body, params: params, onCompletion: { result in
            onCompletion(result)
        })
    }
    */
}
