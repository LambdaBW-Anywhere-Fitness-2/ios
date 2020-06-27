//
//  Client+Convencience.swift
//  AnywhereFitness
//
//  Created by Matthew Martindale on 6/21/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation
import CoreData

extension Client {
    @discardableResult convenience init(
        name: String,
        email: String,
        password: String,
        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {

        self.init(context: context)

        self.name = name
        self.email = email
        self.password = password
    }

    @discardableResult convenience init?(clientRepresentation: ClientRepresentation,
                                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {

        self.init(name: clientRepresentation.name,
                  email: clientRepresentation.email,
                  password: clientRepresentation.password,
                  context: context)
    }

    var clientRepresentation: ClientRepresentation? {
        guard let name = name,
            let email = email,
            let password = password else { return nil}

        return ClientRepresentation(name: name,
                                    email: email,
                                    password: password)
    }

}
