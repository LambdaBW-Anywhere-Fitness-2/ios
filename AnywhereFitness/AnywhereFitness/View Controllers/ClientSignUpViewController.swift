//
//  ClientSignUpViewController.swift
//  AnywhereFitness
//
//  Created by Matthew Martindale on 6/17/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class ClientSignUpViewController: UIViewController {

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
        
        nameTextField.becomeFirstResponder()
        nameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
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
