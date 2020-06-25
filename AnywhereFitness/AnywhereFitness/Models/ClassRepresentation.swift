//
//  ClassRepresentation.swift
//  AnywhereFitness
//
//  Created by Kenneth Jones on 6/24/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

struct ClassRepresentation: Codable {
    var name: String
    var type: String
    var startTime: Date
    var startDate: Date
    var duration: Int64
    var intensity: String
    var location: String
    var numOfAttendees: Int64
    var maxClassSize: Int64
}
