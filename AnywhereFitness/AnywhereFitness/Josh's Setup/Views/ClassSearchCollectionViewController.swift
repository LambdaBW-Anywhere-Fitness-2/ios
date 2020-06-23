//
//  ClassSearchCollectionViewController.swift
//  AnywhereFitness
//
//  Created by Josh Kocsis on 6/22/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ClassSearchCell"

class ClassSearchCollectionViewController: UICollectionViewController {

    let classSearchController = ClassSearchController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return classSearchController.classSearch.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ClassSearchCollectionViewCell else { return UICollectionViewCell() }

        let classSearch = classSearchController.classSearch[indexPath.item]
        cell.classSearchImage.image = classSearch.image
        cell.classSearchLabel.text = classSearch.className
        cell.classSearch = classSearch

        return cell
    }

//        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            let classSearch = classSearchController.classSearch[indexPath.item]
//        }
}
