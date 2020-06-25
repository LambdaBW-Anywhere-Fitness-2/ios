//
//  Class+Convenience.swift
//  AnywhereFitness
//
//  Created by Kenneth Jones on 6/24/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation
import CoreData

enum ClassType: String, CaseIterable {
    case yoga, running, boxing, weightlifting, dancing, biking
}

enum Intensity: String, CaseIterable {
    case beginner, intermediate, advanced
}

extension FitnessClass {
    var classRepresentation: ClassRepresentation? {
        guard let name = name,
            let type = type,
        let intensity = intensity,
        let location = location else { return nil }
        
        return ClassRepresentation(name: name, type: type, startTime: startTime ?? Date(), startDate: startDate ?? Date(), duration: duration, intensity: intensity, location: location, numOfAttendees: numOfAttendees, maxClassSize: maxClassSize)
    }
    
    @discardableResult convenience init(name: String,
                                        type: ClassType,
                                        startTime: Date,
                                        startDate: Date,
                                        duration: Int64,
                                        intensity: Intensity,
                                        location: String,
                                        numOfAttendees: Int64,
                                        maxClassSize: Int64,
                                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.name = name
        self.type = type.rawValue
        self.startTime = startTime
        self.startDate = startDate
        self.duration = duration
        self.intensity = intensity.rawValue
        self.location = location
        self.numOfAttendees = numOfAttendees
        self.maxClassSize = maxClassSize
    }
    
    @discardableResult convenience init?(classRepresentation: ClassRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        guard let type = ClassType(rawValue: classRepresentation.type),
            let intensity = Intensity(rawValue: classRepresentation.intensity) else {
                return nil }
        
        self.init(name: classRepresentation.name,
                  type: type,
                  startTime: classRepresentation.startTime,
                  startDate: classRepresentation.startDate,
                  duration: classRepresentation.duration,
                  intensity: intensity,
                  location: classRepresentation.location,
                  numOfAttendees: classRepresentation.numOfAttendees,
                  maxClassSize: classRepresentation.maxClassSize,
                  context: context)
    }
}
