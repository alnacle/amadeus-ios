import Foundation

public protocol APIRequest {
    
    associatedtype Response: Decodable
    
    var resource: String { get set }
    var body: Data? { get set }
    var method: String { get set }
    var parameters: [String:Any]? { get set }
    
}
