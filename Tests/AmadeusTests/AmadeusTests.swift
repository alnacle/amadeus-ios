import XCTest
@testable import Amadeus

class AmadeusTests: XCTestCase {
    
    var client : Amadeus!
    
    override func setUp() {
        super.setUp()
        self.client = Amadeus()
    }
    
    /*
    func testGenerateURL() {
        XCTAssertEqual( generateURL(client: self.client.client, path: "path", data: ["foo":"bar"]), "https://test.api.amadeus.com/path?foo=bar", "")
    }
    */
    
    func testConfiguration() {
        let conf = Configuration(environment: [:])
        XCTAssertEqual(conf.logLevel, "silent")
        XCTAssertEqual(conf.host, "test.api.amadeus.com")
        XCTAssertTrue(conf.ssl)
        XCTAssertEqual(conf.port, 443)
        XCTAssertEqual(conf.customAppId, "amadeus-swift-sdk")
        XCTAssertEqual(conf.customAppVersion, "1.0.0")
    }
    
    func testBuildCustomLogger() {
        let conf = Configuration(environment: ["logLevel":"debug"])
         XCTAssertEqual(conf.logLevel, "debug")
    }
    func testBuildCustomHostname() {
        let conf = Configuration(environment: ["hostName":"production"])
        XCTAssertEqual(conf.host, "test.api.amadeus.com")
    }
    func testBuildCustomHost() {
        let conf = Configuration(environment: ["host":"foo.bar.com"])
        XCTAssertEqual(conf.host, "foo.bar.com")
    }
    func testBuildCustomSsl() {
        let conf = Configuration(environment: ["ssl":true])
        XCTAssertTrue(conf.ssl)
        XCTAssertEqual(conf.port, 443)
    }
    
    func testBuildCustomSslWithCustomPort() {
        let conf = Configuration(environment: ["port":8080,"ssl":true])
        XCTAssertTrue(conf.ssl)
        XCTAssertEqual(conf.port, 8080)
    }
    
    func testBuildCustomNonSsl() {
        let conf = Configuration(environment: ["ssl":false])
        XCTAssertFalse(conf.ssl)
    }
    
    func testBuildCustomNonSslWithCustomPort() {
        let conf = Configuration(environment: ["port":8080,"ssl":false])
        XCTAssertFalse(conf.ssl)
        XCTAssertEqual(conf.port, 8080)
    }
}
