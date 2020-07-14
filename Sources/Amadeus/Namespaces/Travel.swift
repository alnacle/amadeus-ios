import Foundation

public struct Travel {
    public let analytics: Analytics
    public let predictions: Predictions
    public let tripParserJobs: TripParserJobs

    public init(client: Client) {
        analytics = Analytics(client: client)
        predictions = Predictions(client: client)
        tripParserJobs = TripParserJobs(client: client)
    }
}
