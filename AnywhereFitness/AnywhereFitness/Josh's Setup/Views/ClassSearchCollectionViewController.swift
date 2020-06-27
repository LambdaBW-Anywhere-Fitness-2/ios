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
    var classSearch: ClassSearch?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return classSearchController.classSearch.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ClassSearchCollectionViewCell else { return UICollectionViewCell() }

        let classSearch = classSearchController.classSearch[indexPath.item]
        cell.classSearchImage.image = classSearch.image
        cell.classSearchLabel.text = classSearch.className

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "DefinedSearchSegue":
            if let definedSearchVC = segue.destination as? DefinedSearchViewController {
                definedSearchVC.classSearch = self.classSearch
                definedSearchVC.classSearchController = self.classSearchController
            }
        default:
            break
        }
    }
}
