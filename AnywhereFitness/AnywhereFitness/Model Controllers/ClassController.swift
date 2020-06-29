//
//  ClassController.swift
//  AnywhereFitness
//
//  Created by Kenneth Jones on 6/24/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation
import CoreData

let baseURL = URL(string: "https://anywherefitnessapp.herokuapp.com/api")!

class ClassController {
    typealias CompletionHandler = (Result<Bool, NetworkError>) -> Void

    func createClass(fitnessClass: FitnessClass, completion: @escaping CompletionHandler = { _ in }) {
        let createURL = baseURL.appendingPathComponent("/instructor/createclass")

        var request = URLRequest(url: createURL)
        request.httpMethod = HTTPMethod.post.rawValue

        do {
            guard let representation = fitnessClass.classRepresentation else {
                completion(.failure(.badResponse))
                return
            }

            request.httpBody = try JSONEncoder().encode(representation)
        } catch {
            print("Error encoding class \(fitnessClass): \(error)")
            completion(.failure(.noEncode))
            return
        }

        URLSession.shared.dataTask(with: request) { (_, _, error) in
            if let error = error {
                print("Error POSTing class to server: \(error)")
                DispatchQueue.main.async {
                    completion(.failure(.otherError))
                    return
                }
            }

            DispatchQueue.main.async {
                completion(.success(true))
            }
        }.resume()
    }
}
