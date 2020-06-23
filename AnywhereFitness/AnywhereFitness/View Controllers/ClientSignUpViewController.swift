//
//  ClientSignUpViewController.swift
//  AnywhereFitness
//
//  Created by Matthew Martindale on 6/17/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class ClientSignUpViewController: UIViewController {
    
    // MARK: - Properties
    var networkController: NetworkController?

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        navBar.backgroundColor = .pacificBlue
        confirmButton.backgroundColor = .pacificBlue
        confirmButton.layer.cornerRadius = 7
        
        // Form set up
        nameTextField.becomeFirstResponder()
        nameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
    }

    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        if let name = nameTextField.text,
            !name.isEmpty,
            let email = emailTextField.text,
            !email.isEmpty,
            let phoneNumber = phoneNumberTextField.text,
            !phoneNumber.isEmpty {
            
            #warning("Create sign client up method")
            
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

extension ClientSignUpViewController: UITextFieldDelegate {
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
