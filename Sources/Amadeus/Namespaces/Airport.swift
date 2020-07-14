import Foundation

public struct Airport {
    
    public let predictions: Predictions

    public init(client: Client) {
        predictions = Predictions(client: client)
    }
   
}
