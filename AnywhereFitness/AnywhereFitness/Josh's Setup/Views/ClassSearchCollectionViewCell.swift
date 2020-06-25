//
//  ClassSearchCollectionViewCell.swift
//  AnywhereFitness
//
//  Created by Josh Kocsis on 6/22/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class ClassSearchCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var classSearchImage: UIImageView!
    @IBOutlet weak var classSearchLabel: UILabel!

    static let reuseIdentifier = "ClassSearchCell"
    var classSearch: ClassSearch? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let classSearch = self.classSearch else { return }
        classSearchImage.image = classSearch.image
        classSearchLabel.text = classSearch.className
    }
}
