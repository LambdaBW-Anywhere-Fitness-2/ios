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

        maleButton.setImage(classSearch.checked ? UIImage(systemName: "rectangle") : UIImage(systemName: "checkmark.rectangle"), for: .normal)
    }

    @IBAction func femaleButtonTapped(_ sender: UIButton) {

    }

    @IBAction func beginnerButtonTapped(_ sender: UIButton) {

    }

    @IBAction func intermediateButtonTapped(_ sender: UIButton) {

    }

    @IBAction func advancedButtonTapped(_ sender: UIButton) {

    }

    @IBAction func smallButtonTapped(_ sender: UIButton) {

    }

    @IBAction func mediumButtonTapped(_ sender: UIButton) {

    }

    @IBAction func largeButtonTapped(_ sender: UIButton) {

    }

    private func updateViews() {
           guard let classSearch = classSearch else { return }

        maleButton.setImage(classSearch.checked ? UIImage(systemName: "rectangle") : UIImage(systemName: "checkmark.rectangle"), for: .normal)
    }
}
