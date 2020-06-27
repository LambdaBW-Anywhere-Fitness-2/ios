//
//  Instructor+Convenience.swift
//  AnywhereFitness
//
//  Created by Matthew Martindale on 6/21/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation
import CoreData

extension Instructor {
    @discardableResult convenience init(
        name: String,
        email: String,
        password: String,
        roleID: String,
        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {

        self.init(context: context)

        self.name = name
        self.email = email
        self.password = password
        self.roleID = roleID
    }

    @discardableResult convenience init?(instructorRepresentation: InstructorRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {

        self.init(name: instructorRepresentation.name,
                  email: instructorRepresentation.email,
                  password: instructorRepresentation.password,
                  roleID: instructorRepresentation.roleID,
                  context: context)
    }

    var instructorRepresentation: InstructorRepresentation? {
        guard let name = name,
            let email = email,
            let password = password,
            let roleID = roleID else { return nil }

        return InstructorRepresentation(name: name,
                                        email: email,
                                        password: password,
                                        roleID: roleID)
    }

}
