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
        networkController.get(url: url) { (_, _) in
            // Return data
        }
        XCTAssert(session.lastURL == url)
    }

    func testGetShouldReturnData() {
        let expectedData = "{}".data(using: .utf8)

        session.nextData = expectedData

        var actualData: Data?
        networkController.get(url: URL(string: "http://mockurl")!) { (data, _) in
            actualData = data
        }
        XCTAssertNotNil(actualData)
    }

    func testClientSignUp() {
        var clientError: Error?
        let client = Client(name: "nameTest", email: "emailTest", password: "passwordTest")

        networkController.signUpAsClient(with: client) { (error) in
            clientError = error
        }
        XCTAssert(clientError == nil)
    }

    func testGetClient() {
        let client = Client(name: "Matt", email: "matt@gmail.com", password: "password")

        networkController.signUpAsClient(with: client) { (error) in
            XCTAssert(error == nil)
            XCTAssert(client.name == "Matt")
        }
    }

    func testGetClientPassword() {
        let client = Client(name: "Matt", email: "matt@gmail.com", password: "password")

        networkController.signUpAsClient(with: client) { (error) in
            XCTAssert(error == nil)
        }
        XCTAssert(client.password == "password")
    }

    func testGetClientEmail() {
        let client = Client(name: "Matt", email: "matt@gmail.com", password: "password")

        networkController.signUpAsClient(with: client) { (error) in
            XCTAssert(error == nil)
        }
        XCTAssert(client.email == "matt@gmail.com")
    }

    func testInstructorSignUp() {
        var networkError: Error?

        let instructor = Instructor(name: "Mr. Matt",
                                    email: "instructor@gmail.com",
                                    password: "password",
                                    roleID: "123")

        networkController.signUpAsInstructor(with: instructor) { (error) in
            networkError = error
        }
        XCTAssert(networkError == nil)
    }

    func testGetInstructor() {
        let instructor = Instructor(name: "Mr. Matt",
                                    email: "instructor@gmail.com",
                                    password: "password",
                                    roleID: "123")

        networkController.signUpAsInstructor(with: instructor) { (error) in
            XCTAssert(error == nil)
        }
        XCTAssert(instructor.name == "Mr. Matt")
    }

    func testInstructorPassword() {
        let instructor = Instructor(name: "Mr. Matt",
                                    email: "instructor@gmail.com",
                                    password: "password",
                                    roleID: "123")

        networkController.signUpAsInstructor(with: instructor) { (error) in
            XCTAssert(error == nil)
        }
        XCTAssert(instructor.password == "password")
    }

    func testInstructorEmail() {
        let instructor = Instructor(name: "Mr. Matt",
                                    email: "instructor@gmail.com",
                                    password: "password",
                                    roleID: "123")

        networkController.signUpAsInstructor(with: instructor) { (error) in
            XCTAssert(error == nil)
        }
        XCTAssert(instructor.email == "instructor@gmail.com")
    }

    func testInstructorRoleID() {
        let instructor = Instructor(name: "Mr. Matt",
                                    email: "instructor@gmail.com",
                                    password: "password",
                                    roleID: "123")

        networkController.signUpAsInstructor(with: instructor) { (error) in
            XCTAssert(error == nil)
        }
        XCTAssert(instructor.roleID == "123")
    }

}
