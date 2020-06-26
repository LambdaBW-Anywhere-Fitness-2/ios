//
//  AnywhereFitnessTests.swift
//  AnywhereFitnessTests
//
//  Created by Matthew Martindale on 6/24/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import XCTest
@testable import AnywhereFitness

class AnywhereFitnessTests: XCTestCase {

    var networkController: NetworkController!
    let session = MockURLSession()
    
    override func setUp() {
        super.setUp()
        networkController = NetworkController(session: session)
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testGetRequestWithURL() {
        guard let url = URL(string: "https://mockurl") else {
            fatalError("URL can't be empty")
        }
        networkController.get(url: url) { (success, response) in
            // Return data
        }
        XCTAssert(session.lastURL == url)
    }
    
    func testGetShouldReturnData() {
        let expectedData = "{}".data(using: .utf8)
        
        session.nextData = expectedData
        
        var actualData: Data?
        networkController.get(url: URL(string: "http://mockurl")!) { (data, error) in
            actualData = data
        }
        XCTAssertNotNil(actualData)
    }
    
    func testClientSignUp() {
        var clientError: Error? = nil
        let client = Client(name: "nameTest", email: "emailTest", password: "passwordTest")
        
        networkController.signUpAsClient(with: client) { (error) in
            clientError = error
        }
        XCTAssert(clientError != nil)
    }

}
