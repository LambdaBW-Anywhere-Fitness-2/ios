//
//  Client+Codable.swift
//  AnywhereFitness
//
//  Created by Matthew Martindale on 6/21/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

extension Client: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(name, forKey: .name)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(identifier, forKey: .identifier)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case email
        case password
        case identifier
    }
    
}
