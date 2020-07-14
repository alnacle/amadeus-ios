import Foundation

public enum LogLevel: Int {
    case SILENT = 0
    case VERBOSE = 1
}

public struct Configuration {
    
    public var logLevel = LogLevel.VERBOSE
    
    public var scheme = "https"
    public var host = "test.api.amadeus.com"
    
    public var customAppId = "amadeus-ios-sdk/2.0.0"
    
    public var client_id : String = ""
    public var client_secret : String = ""

}
