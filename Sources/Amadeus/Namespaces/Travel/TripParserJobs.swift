import Foundation

public struct TripParserJobs {
    private var client: Client
    
    public init(client: Client) {
        self.client = client
    }
    
    public func status(jobId: String) -> TripParserStatus {
        return TripParserStatus(client: client, jobId: jobId)
    }
    
    public func result(jobId: String) -> TripParserResult {
        return TripParserResult(client: client, jobId: jobId)
    }
    
    /*
   public func post(body: AnyObject, onCompletion: @escaping AmadeusResponse) {
        client.post(path: "/v2/travel/trip-parser-jobs", body: body, onCompletion: {
            result in
            onCompletion(result)
        })
    }*/
}
