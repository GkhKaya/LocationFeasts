//
//  LocationFeastsTests.swift
//  LocationFeastsTests
//
//  Created by Gokhan Kaya on 7.02.2024.
//

import XCTest
import Alamofire
@testable import LocationFeasts
final class LocationFeastsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFetchApiResult() async throws{
        let networkManager = NetworkManager()
        let headers : HTTPHeaders=[
            .authorization(RestApiKey.key)
        ]
        let paramaters: Parameters=[
            "location" : "edirne",
            "term": "kebap"
        ]
        do{
            let response = try await networkManager.fetchResult(url: "https://api.yelp.com/v3/businesses/search",headers: headers,parameters: paramaters,type: ResultModel.self)
            XCTAssertEqual(response?.businesses?.isEmpty, false)
        }catch{
            XCTFail("Your service has error \(error)")
        }
    }


}
