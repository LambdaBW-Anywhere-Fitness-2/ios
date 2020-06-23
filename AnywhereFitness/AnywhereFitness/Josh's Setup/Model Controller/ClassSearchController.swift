//
//  ClassSearchController.swift
//  AnywhereFitness
//
//  Created by Josh Kocsis on 6/22/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

class ClassSearchController {
    var classSearch: [ClassSearch] {
        let classSearch = [
            ClassSearch(className: "Yoga", imageName: "yoga"),
            ClassSearch(className: "Running", imageName: "running"),
            ClassSearch(className: "Boxing", imageName: "boxing"),
            ClassSearch(className: "Weightlifting", imageName: "weightlifting"),
            ClassSearch(className: "Dancing", imageName: "dancing"),
            ClassSearch(className: "Biking", imageName: "biking")
        ]

            return classSearch
    }
}
