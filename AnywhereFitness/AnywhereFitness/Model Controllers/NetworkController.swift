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
    case badResponse
}

class NetworkController {
    
    let baseURL: URL = URL(string: "https://anywherefitnessapp.herokuapp.com/api")!
    var token: Token?
    
    func signUpAsClient(with client: Client, completion: @escaping (NetworkError?) -> Void) {
        let signUpURL = baseURL.appendingPathComponent("/signup/client")
        
        var request = URLRequest(url: signUpURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(client)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding client signUp data: \(error)")
            completion(.noEncode)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: request) { (_, response, error) in
            guard error == nil else {
                completion(.otherError)
                return
            }
            
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                NSLog("Bad network response, status code:\(response.statusCode)")
                completion(.badResponse)
                return
            }
            completion(nil)
        }
        dataTask.resume()
    }
    
    func signUpAsInstructor(with instructor: Instructor, completion: @escaping (NetworkError?) -> Void) {
        let signUpURL = baseURL.appendingPathComponent("/signup/instructor")
        
        var request = URLRequest(url: signUpURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(instructor)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding instructor signUp data: \(error)")
            completion(.noEncode)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: request) { (_, response, error) in
            guard error == nil else {
                completion(.otherError)
                return
            }
            
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                NSLog("Bad network response, status code:\(response.statusCode)")
                completion(.badResponse)
                return
            }
            completion(nil)
        }
        dataTask.resume()
    }
    
    func logIn(with user: UserLogin, completion: @escaping (Result<Token, NetworkError>) -> Void) {
        let loginURL = baseURL.appendingPathComponent("")
        
        var request = URLRequest(url: loginURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(user)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding login data: \(error)")
            completion(.failure(.noEncode))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.otherError))
                return
            }
            
            if let response = response as? HTTPURLResponse,
            response.statusCode != 200 {
                NSLog("Bad network response, status code:\(response.statusCode)")
                completion(.failure(.badResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let token = try jsonDecoder.decode(Token.self, from: data)
                completion(.success(token))
            } catch {
                NSLog("Error decoding token: \(error)")
                completion(.failure(.noDecode))
                return
            }
        }
        dataTask.resume()
    }
    
}
