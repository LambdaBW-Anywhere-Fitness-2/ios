//
//  NetworkController.swift
//  AnywhereFitness
//
//  Created by Matthew Martindale on 6/22/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum NetworkError: Error {
    case noIdentifier
    case otherError
    case noData
    case noDecode
    case noEncode
    case noRep
}

class NetworkController {
    
    let baseURL: URL = URL(string: "https://anywherefitnessapp.herokuapp.com/api")!
    var token: Token?
    
    func signUpAsClient(with client: Client, completion: @escaping (Result<Client, NetworkError>) -> Void) {
        let signUpURL = baseURL.appendingPathComponent("/signup/client")
        
        var request = URLRequest(url: signUpURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "")
    }
    
    func signUpAsInstructor(with instructor: Instructor, completion: @escaping (Result<Instructor, NetworkError>) -> Void) {
        
    }
    
}
