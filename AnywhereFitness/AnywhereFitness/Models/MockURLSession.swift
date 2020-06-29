//
//  MockURLSession.swift
//  AnywhereFitness
//
//  Created by Matthew Martindale on 6/25/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

class MockURLSession: URLSessionProtocol {

    var nextDataTask = MockURLSessionDataTask()
    var nextData: Data?
    var nextError: Error?

    private (set) var lastURL: URL?

    func successHttpURLResponse(request: URLRequest) -> URLResponse {
        return HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
    }

    func dataTask(with request: URLRequest, completion: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = request.url

        completion(nextData, successHttpURLResponse(request: request), nextError)
        return nextDataTask
    }
}

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private (set) var resumeWasCalled = false

    func resume() {
        resumeWasCalled = true
    }
}
