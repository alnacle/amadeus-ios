import Foundation

public enum APIError: Error {
    
    case invalidEndpoint
    case unknown
    case noData
    case badRequest
    case authenticationError
    case notFound
    case serverError
    case tooManyRequests
    case decodingError(String)
    
    var localizedDescription: String {
        switch self {
        case .authenticationError:
            return "Authentication Error"
        case .notFound:
            return "Not Found"
        case .badRequest:
            return "Incorrect parameters"
        case .invalidEndpoint:
            return "Unable to create network request"
        case .noData:
            return "No data was retrieved"
        case .serverError:
            return "Internal Server Error"
        case .tooManyRequests:
            return "Too many requests"
        default:
            return "Unknown Error"
        }
    }
}

