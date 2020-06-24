//
//  LandingPageViewController.swift
//  AnywhereFitness
//
//  Created by Matthew Martindale on 6/17/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {
    
    // MARK: - Properties
    let networkController = NetworkController()
    
    @IBOutlet weak var landingPageImageView: UIImageView!
    @IBOutlet weak var tagLineLabel: UILabel!
    @IBOutlet weak var clientButton: UIButton!
    @IBOutlet weak var instructorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
    }
    
    func setUpViews() {
        // Background Image
        view.backgroundColor = .smokyBlack
        landingPageImageView.alpha = 0.2
        
        // Buttons
        clientButton.backgroundColor = .pacificBlue
        clientButton.layer.cornerRadius = 5
        instructorButton.backgroundColor = .offWhite
        instructorButton.layer.cornerRadius = 5
        
        // Labels
        tagLineLabel.textColor = .pacificBlue
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InstructorSignUpSegue" {
            let instructorSignUpVC = segue.destination as! InstructorSignUpViewController
            instructorSignUpVC.networkController = networkController
        } else if segue.identifier == "ClientSignUpSegue" {
            let clientSignUpVC = segue.destination as! ClientSignUpViewController
            clientSignUpVC.networkController = networkController
        }
    }

}
