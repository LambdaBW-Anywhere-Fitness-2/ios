//
//  DefinedSearchViewController.swift
//  AnywhereFitness
//
//  Created by Josh Kocsis on 6/23/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit
import CoreData

class DefinedSearchViewController: UIViewController {
    @IBOutlet weak var instructorGenderLabel: UILabel!
    @IBOutlet weak var fitnessLevelLabel: UILabel!
    @IBOutlet weak var classSizeLabel: UILabel!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var beginnerButton: UIButton!
    @IBOutlet weak var intermediateButton: UIButton!
    @IBOutlet weak var advancedButton: UIButton!
    @IBOutlet weak var smallClassButton: UIButton!
    @IBOutlet weak var mediumClassButton: UIButton!
    @IBOutlet weak var largeClassButton: UIButton!

    var classSearchController: ClassSearchController?
    var classSearch: ClassSearch? {
        didSet {
            updateViews()
        }
    }
    var fitnessClass: FitnessClass?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    @IBAction func maleButtonTapped(_ sender: UIButton) {
        guard var classSearch = classSearch else { return }

        classSearch.checked.toggle()

        maleButton.setImage(classSearch.checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
    }

    @IBAction func femaleButtonTapped(_ sender: UIButton) {
        guard var classSearch = classSearch else { return }

        classSearch.checked.toggle()

        femaleButton.setImage(classSearch.checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
    }

    @IBAction func beginnerButtonTapped(_ sender: UIButton) {
        guard var classSearch = classSearch else { return }

        classSearch.checked.toggle()

        beginnerButton.setImage(classSearch.checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
    }

    @IBAction func intermediateButtonTapped(_ sender: UIButton) {
        guard var classSearch = classSearch else { return }

        classSearch.checked.toggle()

        intermediateButton.setImage(classSearch.checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
    }

    @IBAction func advancedButtonTapped(_ sender: UIButton) {
        guard var classSearch = classSearch else { return }

        classSearch.checked.toggle()

        advancedButton.setImage(classSearch.checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
    }

    @IBAction func smallButtonTapped(_ sender: UIButton) {
        guard var classSearch = classSearch else { return }

        classSearch.checked.toggle()

        smallClassButton.setImage(classSearch.checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
    }

    @IBAction func mediumButtonTapped(_ sender: UIButton) {
        guard var classSearch = classSearch else { return }

        classSearch.checked.toggle()

        mediumClassButton.setImage(classSearch.checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
    }

    @IBAction func largeButtonTapped(_ sender: UIButton) {
        guard var classSearch = classSearch else { return }

        classSearch.checked.toggle()

        largeClassButton.setImage(classSearch.checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
    }

    private func updateViews() {
        guard let classSearch = classSearch else { return }

        maleButton.setImage(classSearch.checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        femaleButton.setImage(classSearch.checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        beginnerButton.setImage(classSearch.checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        intermediateButton.setImage(classSearch.checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        advancedButton.setImage(classSearch.checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        smallClassButton.setImage(classSearch.checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        mediumClassButton.setImage(classSearch.checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        largeClassButton.setImage(classSearch.checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)

        if maleButton.isSelected || femaleButton.isSelected {
            instructorGenderLabel.backgroundColor = .subtleRed
        }

        if beginnerButton.isSelected {
            fitnessLevelLabel.backgroundColor = .subtleRed
        } else if intermediateButton.isSelected {
            fitnessLevelLabel.backgroundColor = .subtleRed
        } else if advancedButton.isSelected {
            fitnessLevelLabel.backgroundColor = .subtleRed
        } else {
            print("Didn't work.")
        }

        if smallClassButton.isSelected {
            classSizeLabel.backgroundColor = .subtleRed
        } else if mediumClassButton.isSelected {
            classSizeLabel.backgroundColor = .subtleRed
        } else if largeClassButton.isSelected {
            classSizeLabel.backgroundColor = .subtleRed
        } else {
            print("Didn't work.")
        }
    }
}
