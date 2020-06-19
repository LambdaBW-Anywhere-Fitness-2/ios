//
//  InstructorSignUpViewController.swift
//  AnywhereFitness
//
//  Created by Matthew Martindale on 6/17/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class InstructorSignUpViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var authenticationCodeTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        navBar.backgroundColor = .kombuGreen
        confirmButton.backgroundColor = .kombuGreen
        confirmButton.layer.cornerRadius = 7
        
        // form set up
        nameTextField.becomeFirstResponder()
        nameTextField.delegate = self
        phoneTextField.delegate = self
        authenticationCodeTextField.delegate = self
        websiteTextField.delegate = self
    }

    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        print("hey hey")
    }
    
    
}

extension InstructorSignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
