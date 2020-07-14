import Foundation

public struct PredictionResponse: Codable {
    let id, probability, result, subType: String
    let type: String
}

public struct FlightDelayPredictionResponse: Codable {
    let data: [PredictionResponse]
}

public struct AirportPredictionResponse: Codable {
    let data: PredictionResponse
}
