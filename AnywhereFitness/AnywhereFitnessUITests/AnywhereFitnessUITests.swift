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

    func testLogInClient() {

        let app = XCUIApplication()
        app.launch()
        app.textFields["email"].tap()

        let cKey = app.keys["c"]
        cKey.tap()

        let lKey = app.keys["l"]
        lKey.tap()

        let iKey = app.keys["i"]
        iKey.tap()

        let eKey = app.keys["e"]
        eKey.tap()

        let nKey = app.keys["n"]
        nKey.tap()

        let tKey = app.keys["t"]
        tKey.tap()

        let moreKey = app.keys["more"]
        moreKey.tap()

        let key = app.keys["@"]
        key.tap()

        let moreKey2 = app.keys["more"]
        moreKey2.tap()

        let yKey = app.keys["y"]
        yKey.tap()

        let aKey = app.keys["a"]
        aKey.tap()

        let hKey = app.keys["h"]
        hKey.tap()

        let oKey = app.keys["o"]
        oKey.tap()
        oKey.tap()
        moreKey.tap()

        let key2 = app.keys["."]
        key2.tap()
        moreKey2.tap()
        cKey.tap()
        oKey.tap()

        let mKey = app.keys["m"]
        mKey.tap()

        let returnButton = app.buttons["Return"]
        returnButton.tap()

        let pKey = app.keys["p"]
        pKey.tap()
        aKey.tap()
        let sKey = app.keys["s"]
        sKey.tap()
        sKey.tap()
        let wKey = app.keys["w"]
        wKey.tap()
        oKey.tap()
        let rKey = app.keys["r"]
        rKey.tap()
        let dKey = app.keys["d"]
        dKey.tap()

        let logInStaticText = app.staticTexts["Log In"]
        returnButton.tap()
        logInStaticText.tap()

        let clientTitle = app.navigationBars["Client"].staticTexts["Client"]
        XCTAssertTrue(clientTitle.label == "Client")
    }

    func testLogOutClient() {

        let app = XCUIApplication()
        app.launch()

        app.navigationBars["Client"].buttons["Log Out"].tap()
        let appTitle = app.staticTexts["Anywhere"]

        XCTAssert(appTitle.label == "Anywhere")
    }

    func testLogInInstructor() {

        let app2 = app
        app2.launch()
        app2.textFields["email"].tap()

        let iKey = app2.keys["i"]
        iKey.tap()

        let nKey = app2.keys["n"]
        nKey.tap()

        let sKey = app2.keys["s"]
        sKey.tap()

        let tKey = app2.keys["t"]
        tKey.tap()

        let rKey = app2.keys["r"]
        rKey.tap()

        let uKey = app2.keys["u"]
        uKey.tap()

        let cKey = app2.keys["c"]
        cKey.tap()
        tKey.tap()

        let oKey = app2.keys["o"]
        oKey.tap()
        rKey.tap()

        let moreKey = app2.keys["more"]
        moreKey.tap()

        let key = app2.keys["@"]
        key.tap()

        let moreKey2 = app2.keys["more"]
        moreKey2.tap()

        let yKey = app2.keys["y"]
        yKey.tap()

        let aKey = app2.keys["a"]
        aKey.tap()

        let hKey = app2.keys["h"]
        hKey.tap()
        oKey.tap()
        oKey.tap()
        moreKey.tap()

        let key2 = app2.keys["."]
        key2.tap()
        moreKey2.tap()
        cKey.tap()
        oKey.tap()

        let mKey = app2.keys["m"]
        mKey.tap()
        app.textFields["password"].tap()

        let pKey = app2.keys["p"]
        pKey.tap()
        aKey.tap()
        sKey.tap()
        sKey.tap()

        let wKey = app2.keys["w"]
        wKey.tap()
        oKey.tap()
        rKey.tap()

        let dKey = app2.keys["d"]
        dKey.tap()
        app2.buttons["Return"].tap()
        app2.staticTexts["Log In"].tap()
        let instructorTitle = app.navigationBars["Instructor"].staticTexts["Instructor"]

        XCTAssert(instructorTitle.label == "Instructor")
    }

    func testLogOutInstructor() {

        app.launch()
        app.navigationBars["Instructor"].buttons["Log Out"].tap()
        let homePageTitle = app.staticTexts["Anywhere"]

        XCTAssert(homePageTitle.label == "Anywhere")

    }

    func testFormValidationInstructorSignUp() {

        app.launch()
        app.staticTexts["For Instructors"].tap()

        let returnButton = app.buttons["Return"]
        returnButton.tap()
        returnButton.tap()
        returnButton.tap()
        returnButton.tap()
        app.staticTexts["Confirm"].tap()
        let text = "Missing some information..."
        let alertTitle = app.alerts[text].scrollViews.otherElements.staticTexts[text]
        XCTAssert(alertTitle.label == "Missing some information...")
    }
}
