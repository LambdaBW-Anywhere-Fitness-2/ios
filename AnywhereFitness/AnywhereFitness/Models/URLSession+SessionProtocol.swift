//
//  URLSession+SessionProtocol.swift
//  AnywhereFitness
//
//  Created by Matthew Martindale on 6/25/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

extension URLSession: URLSessionProtocol {
    func dataTask(with request: URLRequest, completion: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        return dataTask(with: request, completionHandler: completion) as URLSessionDataTask
    }
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
