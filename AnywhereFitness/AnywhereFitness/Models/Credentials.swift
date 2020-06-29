//
//  Token.swift
//  AnywhereFitness
//
//  Created by Matthew Martindale on 6/22/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

struct Credentials: Codable {
    let token: String
    let roleID: Int

    enum CodingKeys: String, CodingKey {
        case token
        case roleID = "role_id"
    }
}
