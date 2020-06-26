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
            ClassSearch(className: "Yoga", imageName: "yoga", checked: false),
            ClassSearch(className: "Running", imageName: "running", checked: false),
            ClassSearch(className: "Boxing", imageName: "boxing", checked: false),
            ClassSearch(className: "Weightlifting", imageName: "weightlifting", checked: false),
            ClassSearch(className: "Dancing", imageName: "dancing", checked: false),
            ClassSearch(className: "Biking", imageName: "biking", checked: false)
        ]

            return classSearch
    }
}
