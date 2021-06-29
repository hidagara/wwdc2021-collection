//
//  wwdc2021_collectionTests.swift
//  wwdc2021-collectionTests
//
//  Created by Media Guest on 28.06.2021.
//

import XCTest
@testable import wwdc2021_collection

class wwdc2021_collectionTests: XCTestCase {
    
    
    class Traveler {
        var name: String?
        var destination: String?
    }


    func test() {
        let traveler1 = Traveler()
        traveler1.name = "Roman"
        let traveler2 = traveler1
        traveler2.destination = "Big Sur"
        print("Done traveling")
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
