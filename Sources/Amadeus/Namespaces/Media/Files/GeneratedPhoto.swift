import Foundation

public struct GeneratedPhotos {
    private var client: Client
    
    public init(client: Client) {
        self.client = client
    }
    
    /*
    public func get(params: [String: String], onCompletion: @escaping AmadeusResponse) {
        client.get(path: "v2/media/files/generated-photos", params: params, onCompletion: {
            result in
            onCompletion(result)
        })
    }
    */
}
