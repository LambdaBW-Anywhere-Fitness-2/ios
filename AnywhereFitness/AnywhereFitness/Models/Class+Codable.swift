//
//  Class+Codable.swift
//  AnywhereFitness
//
//  Created by Kenneth Jones on 6/24/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

extension FitnessClass: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(type, forKey: .type)
        try container.encode(startTime, forKey: .startTime)
        try container.encode(startDate, forKey: .startDate)
        try container.encode(duration, forKey: .duration)
        try container.encode(intensity, forKey: .intensity)
        try container.encode(location, forKey: .location)
        try container.encode(numOfAttendees, forKey: .numOfAttendees)
        try container.encode(maxClassSize, forKey: .maxClassSize)
    }

    enum CodingKeys: String, CodingKey {
        case name = "class_name"
        case type
        case startTime = "start_time"
        case startDate = "start_date"
        case duration
        case intensity = "intensity_level"
        case location
        case numOfAttendees = "registered_attendees"
        case maxClassSize = "class_size"
    }

}
