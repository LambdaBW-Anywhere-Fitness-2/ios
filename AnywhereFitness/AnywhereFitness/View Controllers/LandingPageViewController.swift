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

    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var landingPageImageView: UIImageView!
    @IBOutlet weak var logInView: UIView!
    @IBOutlet weak var tagLineLabel: UILabel!
    @IBOutlet weak var clientButton: UIButton!
    @IBOutlet weak var instructorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        initHideKeyboardGesture()
    }
    
    func setUpViews() {
        // Background Image
        view.backgroundColor = .smokyBlack
        landingPageImageView.alpha = 0.2
        
        // Log In View
        logInView.layer.cornerRadius = 5
        logInButton.backgroundColor = .pacificBlue
        logInButton.layer.cornerRadius = 5
        
        // Buttons
        clientButton.backgroundColor = .pacificBlue
        clientButton.layer.cornerRadius = 5
        instructorButton.backgroundColor = .offWhite
        instructorButton.layer.cornerRadius = 5
        
        // Labels
        tagLineLabel.textColor = .pacificBlue
        
        // Form setup
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func logInButtonTapped(_ sender: UIButton) {
        if let email = emailTextField.text,
            !email.isEmpty,
            let password = passwordTextField.text,
            !password.isEmpty {
            
            let userLogin = UserLogin(email: email, password: password)
            networkController.logIn(with: userLogin) { result in
                switch result {
                case .success(let credentials):
                    print(credentials)
                case .failure(let error):
                    switch error {
                    case .noIdentifier:
                        print("No Identifier")
                    case .otherError:
                        print("Logging in error: \(error)")
                    case .noData:
                        print("Log in error, no data")
                    case .noDecode:
                        print("Log in error, no decode")
                    case .noEncode:
                        print("Log in error, no encode")
                    case .badResponse:
                        print("Log in error, bad HTTP response")
                    }
                }
            }
            
        }
    }
    
    func initHideKeyboardGesture() {
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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

extension LandingPageViewController: UITextFieldDelegate {
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
