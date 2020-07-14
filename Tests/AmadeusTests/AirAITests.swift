@testable import Amadeus
import XCTest

class AirAITests: XCTestCase {
    var amadeus: Amadeus!
    
    override func setUp() {
        super.setUp()
        
        // Avoid 429 error "Network rate limit is exceeded"
        sleep(1)
        
        amadeus = Amadeus()
    }
    
    override func tearDown() {
        amadeus = nil
        super.tearDown()
    }
    
    func testAirportOnTimePerformance() {
         let expectation = XCTestExpectation(description: "TimeOut")

         let params = ["airportCode": "JFK",
                       "date": "2020-08-01"]
         
         amadeus.airport.predictions.onTime.get(parameters: params, onCompletion: {
             result in
             switch result {
             case .success(let response):
                 print(type(of:response))
                 print(response.data.probability)
                 print(response.data.result)
             case .failure(let error):
                 print(error.localizedDescription)
             }
             expectation.fulfill()
         })

         wait(for: [expectation], timeout: 60)
     }
    
    func testFlightDelayPrediction() {
         let expectation = XCTestExpectation(description: "TimeOut")

         let params = ["originLocationCode": "NCE",
                       "destinationLocationCode": "IST",
                       "departureDate":"2020-08-01",
                       "departureTime":"18:20:00",
                       "arrivalDate":"2020-08-01",
                       "arrivalTime":"22:15:00",
                       "aircraftCode":"321",
                       "carrierCode":"TK",
                       "flightNumber":"1816",
                       "duration":"PT31H10M"]
         
         amadeus.travel.predictions.flightDelay.get(parameters: params, onCompletion: {
             result in
             switch result {
             case .success(let response):
                 print(type(of:response))
                 print(response.data[0].result)
                 print(response.data[0].probability)
             case .failure(let error):
                 print(error.localizedDescription)
             }
             expectation.fulfill()
         })

         wait(for: [expectation], timeout: 60)
     }
    
    func testFlightChoicePrediction() {
        let expectation = XCTestExpectation(description: "TimeOut")

       let params: AmadeusParameter = ["originLocationCode": "MAD",
                      "destinationLocationCode": "BER",
                      "departureDate": "2020-08-16",
                      "returnDate": "2020-08-30",
                      "adults": 1,
                      "nonStop": true,
                      "maxPrice": 200]
        
        amadeus.shopping.flightOffersSearch.get(parameters: params, onCompletion: {
            result in
            switch result {
            case .success(let response):
               let offers = response.data
               self.amadeus.shopping.flightOffers.prediction.post(flightOffers: offers, onCompletion: {
               result in
                   switch result {
                   case .success(let response):
                      print(type(of:response))
                   case .failure(let error):
                       print(error.localizedDescription)
                   }
                   expectation.fulfill()
               })
                   
            case .failure(let error):
                print(error.localizedDescription)
            }
        })

        wait(for: [expectation], timeout: 60)
    }
    /*
    
    func testFlighChoicePrediction() {
        let expectation = XCTestExpectation(description: "TimeOut")
        
        amadeus.shopping.flightOffersSearch.get(params: ["originLocationCode": "MAD",
                                                         "destinationLocationCode": "BER",
                                                         "departureDate": "2020-05-16",
                                                         "returnDate": "2020-05-30",
                                                         "adults": "2"], onCompletion: {
                                                            result in
                                                            
                                                            switch result {
                                                            case .success(let response):
                                                                self.amadeus.shopping.flightOffers.prediction.post(body: response.result, onCompletion: {
                                                                    predictionResult in
                                                                    
                                                                    switch predictionResult {
                                                                    case .success(let response):
                                                                        XCTAssertEqual(response.statusCode, 200)
                                                                    case .failure(let error):
                                                                        fatalError(error.localizedDescription)
                                                                    }
                                                                    
                                                                    expectation.fulfill()
                                                                })
                                                            case .failure(let error):
                                                                fatalError(error.localizedDescription)
                                                            }
                                                            
                                                            
        })
        
        wait(for: [expectation], timeout: 60)
    }
 */
}
