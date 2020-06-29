//
//  AnywhereFitnessUITests.swift
//  AnywhereFitnessUITests
//
//  Created by Matthew Martindale on 6/28/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import XCTest

class AnywhereFitnessUITests: XCTestCase {

    var app: XCUIApplication {
        return XCUIApplication()
    }

    override func setUpWithError() throws {
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        continueAfterFailure = false
    }

    func testSignInClient() {
        
    }

}
