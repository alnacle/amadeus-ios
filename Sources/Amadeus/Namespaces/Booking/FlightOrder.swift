import Foundation

public struct FlightOrder {
    private var client: Client
    private var flightOrderId: String
    
    public init(client: Client, flightOrderId: String) {
        self.client = client
        self.flightOrderId = flightOrderId
    }

    /*
    public func get(onCompletion: @escaping AmadeusResponse) {
        client.get(path: "v1/booking/flight-orders/\(self.flightOrderId)", params: [:], onCompletion: {
            result in
            onCompletion(result)
        })
    }
    
    public func delete(onCompletion: @escaping AmadeusResponse) {
        client.delete(path: "v1/booking/flight-orders/\(self.flightOrderId)", params: [:], onCompletion: {
            result in
            onCompletion(result)
        })
    }
    */
}
