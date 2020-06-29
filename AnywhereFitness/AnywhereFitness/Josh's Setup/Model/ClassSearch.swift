//
//  ClassSearch.swift
//  AnywhereFitness
//
//  Created by Josh Kocsis on 6/22/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation
import UIKit

struct ClassSearch {
    var image: UIImage
    var className: String
    var checked: Bool

    init(className: String, imageName: String, checked: Bool = false) {
        self.className = className
        self.image = UIImage(named: imageName)!
        self.checked = checked
    }
}
