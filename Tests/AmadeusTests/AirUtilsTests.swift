@testable import Amadeus
import XCTest

class AirUtilsTests: XCTestCase {
    
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

    func testAirLines() {
        let expectation = XCTestExpectation(description: "")
        
        let params = ["airlineCodes": "BA"]
        
        amadeus.referenceData.airLines.get(parameters: params, onCompletion: {
            result in
            switch result {
            case .success(let response):
                print(type(of:response))
                print(response.data[0].businessName)
            case .failure(let error):
                print(error.localizedDescription)
            }
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 60)
    }
    

   func testCheckinLinks() {
        let expectation = XCTestExpectation(description: "TimeOut")

        let params = ["airlineCode": "AF"]
        
        amadeus.referenceData.urls.checkinLinks.get(parameters: params, onCompletion: {
            result in
            switch result {
            case .success(let response):
                print(type(of:response))
                print(response.data[0].channel)
                print(response.data[1].id)
            case .failure(let error):
                print(error.localizedDescription)
            }
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 60)
    }

    func testAirportCitySearchById() {
        let expectation = XCTestExpectation(description: "TimeOut")
        
        amadeus.referenceData.location(locationId: "CMUC").get(onCompletion: {
            result in
            switch result {
            case .success(let response):
                print(type(of:response))
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 60)
    }
    
    func testAirportCitySearch() {
        let expectation = XCTestExpectation(description: "TimeOut")
        
        let params: AmadeusParameter = [
            "subType" : "CITY",
            "keyword" : "LON"
        ]
        
        amadeus.referenceData.locations.get(parameters: params, onCompletion: {
                result in
                switch result {
                case .success(let response):
                    print(type(of:response))
                case .failure(let error):
                    fatalError(error.localizedDescription)
                }
                expectation.fulfill()
        })

        wait(for: [expectation], timeout: 60)
    }
    
    /*
    func testAirportNearestRelevant() {
        let expectation = XCTestExpectation(description: "TimeOut")

        amadeus.referenceData.locations.airports.get(params: ["longitude": "2.55",
                                                            "latitude": "49.0000"], onCompletion: {
                result in
                                                                
                                                                switch result {
                                                                case .success(let response):
                                                                    XCTAssertEqual(response.statusCode, 200)
                                                                    
                                                                    self.amadeus.next(response: response, onCompletion: { result in
                                                                        switch result {
                                                                        case .success(_):
                                                                            break
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
