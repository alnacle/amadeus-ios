import Foundation

public struct FlightDates {
    private var client: Client
    
    public init(client: Client) {
        self.client = client
    }
    /*
    public func get(params: [String: String], onCompletion: @escaping AmadeusResponse) {
        client.get(path: "v1/shopping/flight-dates", params: params, onCompletion: {
            result in
            onCompletion(result)
        })
    }*/
}
