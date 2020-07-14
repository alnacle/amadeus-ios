import Foundation

public struct TripParserResult {
    private let client: Client
    private let jobId: String
    
    public init(client: Client, jobId: String) {
        self.client = client
        self.jobId = jobId
    }

    /*
    public func get(onCompletion: @escaping AmadeusResponse) {
        client.get(path: "v2/travel/trip-parser-jobs/\(jobId)/result", params: [:], onCompletion: {
            result in
            onCompletion(result)
        })
    }*/
}
