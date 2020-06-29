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
    @IBOutlet weak var passwordTextField: UITextField!

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
        passwordTextField.delegate = self
    }

    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        if let name = nameTextField.text,
            !name.isEmpty,
            let email = emailTextField.text,
            !email.isEmpty,
            let password = passwordTextField.text,
            !password.isEmpty {

            let client = Client(name: name, email: email, password: password)
            networkController?.signUpAsClient(with: client, completion: { (error) in
                guard error == nil else {
                    NSLog("Error signing up Client: \(error!)")
                    // Displays alert that there was an error signing up
                    DispatchQueue.main.async {
                        self.displaySignInErrorAlert()
                    }
                    return
                }
                // Displays alert that they successfully signed up
                DispatchQueue.main.async {
                    self.displaySignedInAlert()
                }
            })

        } else {
            displayAlert()
        }
    }

    func displaySignedInAlert() {
        let alertController = UIAlertController(title: "Signed In Successful!",
                                                message: "Please log in with email and password",
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        })
                   okAction.setValue(UIColor.black, forKey: "titleTextColor")
                   alertController.addAction(okAction)
                   present(alertController, animated: true, completion: nil)
    }

    func displaySignInErrorAlert() {
        let alertController = UIAlertController(title: "Error signing in!",
                                                message: "Please try again",
                                                preferredStyle: .alert)
                   let okAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
                   okAction.setValue(UIColor.black, forKey: "titleTextColor")
                   alertController.addAction(okAction)
                   present(alertController, animated: true, completion: nil)
    }

    func displayAlert() {
        let alertController = UIAlertController(title: "Missing some information...",
                                                message: "Please fill in all fields",
                                                preferredStyle: .alert)
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
