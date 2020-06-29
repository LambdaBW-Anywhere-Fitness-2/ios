//
//  URLSessionProtocol.swift
//  AnywhereFitness
//
//  Created by Matthew Martindale on 6/25/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void

    func dataTask(with request: URLRequest, completion: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}

protocol URLSessionDataTaskProtocol {
    func resume()
}
