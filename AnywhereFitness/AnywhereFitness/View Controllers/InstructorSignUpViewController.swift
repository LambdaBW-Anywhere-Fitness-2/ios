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
        if let name = nameTextField.text,
            !name.isEmpty,
            let phoneNumber = phoneTextField.text,
            !phoneNumber.isEmpty,
            let authenticationCode = authenticationCodeTextField.text,
            !authenticationCode.isEmpty,
            let website = websiteTextField.text,
            !website.isEmpty {
            
            #warning("Create sign up Instructor method")
            
        } else {
            displayAlert()
            // TODO: - Check what fields are nil and make them the firstResponder
        }
    }
    
    func displayAlert() {
        let alertController = UIAlertController(title: "Missing some information...", message: "Please fill in all fields", preferredStyle: .alert)
                   let okAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
                   okAction.setValue(UIColor.black, forKey: "titleTextColor")
                   alertController.addAction(okAction)
                   present(alertController, animated: true, completion: nil)
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
