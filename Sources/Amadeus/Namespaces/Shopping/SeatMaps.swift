import Foundation

public struct SeatMaps {
    private var client: Client
    
    public init(client: Client) {
        self.client = client
    }
    
    /*
   public func get(params: [String: String], onCompletion: @escaping AmadeusResponse) {
        client.get(path: "v1/shopping/seatmaps", params: params, onCompletion: { result in
            onCompletion(result)
        })
    }
    
   public func post(body: AnyObject, onCompletion: @escaping AmadeusResponse) {
        client.post(path: "v1/shopping/seatmaps", body: body, params: [:], onCompletion: { result in
            onCompletion(result)
        })
    }*/
}
