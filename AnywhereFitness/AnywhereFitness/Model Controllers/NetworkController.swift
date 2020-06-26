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
    case badResponse
}

class NetworkController {
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    let baseURL: URL = URL(string: "https://anywherefitnessapp.herokuapp.com/api")!
    
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
        
        let dataTask = session.dataTask(with: request) { (_, response, error) in
            guard error == nil else {
                completion(.otherError)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            let statusCode = response.statusCode
            let goodNetworkRange = 200...299
            if !goodNetworkRange.contains(statusCode) {
                NSLog("Bad network response, status code:\(response.statusCode)")
                completion(.badResponse)
                return
            }
            print("Successfully signed up")
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
        
        let dataTask = session.dataTask(with: request) { (_, response, error) in
            guard error == nil else {
                completion(.otherError)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            let statusCode = response.statusCode
            let goodNetworkRange = 200...299
            if !goodNetworkRange.contains(statusCode) {
                NSLog("Bad network response, status code:\(response.statusCode)")
                completion(.badResponse)
                return
            }
            
            print("Successfully signed up")
            completion(nil)
        }
        dataTask.resume()
    }
    
    func logIn(with user: UserLogin, completion: @escaping (Result<Credentials, NetworkError>) -> Void) {
        let loginURL = baseURL.appendingPathComponent("signin")
        
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
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.otherError))
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            let statusCode = response.statusCode
            let goodNetworkRange = 200...299
            if !goodNetworkRange.contains(statusCode) {
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
                let credentials = try jsonDecoder.decode(Credentials.self, from: data)
                completion(.success(credentials))
            } catch {
                NSLog("Error decoding token: \(error)")
                completion(.failure(.noDecode))
                return
            }
        }
        dataTask.resume()
    }
    
    func get( url: URL, completion: @escaping (_ data: Data?, _ error: Error?) -> Void ) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { (data, response, error) in
            completion(data, error)
        }
        task.resume()
    }
    
}
