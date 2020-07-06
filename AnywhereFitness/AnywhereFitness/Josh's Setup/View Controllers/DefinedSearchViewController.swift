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
    var classSearch: ClassSearch?
    var fitnessClass: FitnessClass?
    var checked: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    @IBAction func maleButtonTapped(_ sender: UIButton) {
        checked.toggle()
        maleButton.setImage(checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        if checked == false {
            instructorGenderLabel.backgroundColor = .subtleRed
        } else if checked == true {
            instructorGenderLabel.backgroundColor = .black
        }
    }

    @IBAction func femaleButtonTapped(_ sender: UIButton) {
        checked.toggle()
        femaleButton.setImage(checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        if checked == false {
            instructorGenderLabel.backgroundColor = .subtleRed
        } else if checked == true {
            instructorGenderLabel.backgroundColor = .black
        }
    }

    @IBAction func beginnerButtonTapped(_ sender: UIButton) {
        checked.toggle()
        beginnerButton.setImage(checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        if checked == false {
            fitnessLevelLabel.backgroundColor = .subtleRed
        } else if checked == true {
            fitnessLevelLabel.backgroundColor = .black
        }
    }

    @IBAction func intermediateButtonTapped(_ sender: UIButton) {
        checked.toggle()
        intermediateButton.setImage(checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        if checked == false {
            fitnessLevelLabel.backgroundColor = .subtleRed
        } else if checked == true {
            fitnessLevelLabel.backgroundColor = .black
        }
    }

    @IBAction func advancedButtonTapped(_ sender: UIButton) {
        checked.toggle()
        advancedButton.setImage(checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        if checked == false {
            fitnessLevelLabel.backgroundColor = .subtleRed
        } else if checked == true {
            fitnessLevelLabel.backgroundColor = .black
        }
    }

    @IBAction func smallButtonTapped(_ sender: UIButton) {
        checked.toggle()
        smallClassButton.setImage(checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        if checked == false {
            classSizeLabel.backgroundColor = .subtleRed
        } else if checked == true {
            classSizeLabel.backgroundColor = .black
        }
    }

    @IBAction func mediumButtonTapped(_ sender: UIButton) {
        checked.toggle()
        mediumClassButton.setImage(checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        if checked == false {
            classSizeLabel.backgroundColor = .subtleRed
        } else if checked == true {
            classSizeLabel.backgroundColor = .black
        }
    }

    @IBAction func largeButtonTapped(_ sender: UIButton) {
        checked.toggle()
        largeClassButton.setImage(checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        if checked == false {
            classSizeLabel.backgroundColor = .subtleRed
        } else if checked == true {
            classSizeLabel.backgroundColor = .black
        }
    }

    private func updateViews() {


        maleButton.setImage(checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        femaleButton.setImage(checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        beginnerButton.setImage(checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        intermediateButton.setImage(checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        advancedButton.setImage(checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        smallClassButton.setImage(checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        mediumClassButton.setImage(checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
        largeClassButton.setImage(checked ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square"), for: .normal)
    }
}
