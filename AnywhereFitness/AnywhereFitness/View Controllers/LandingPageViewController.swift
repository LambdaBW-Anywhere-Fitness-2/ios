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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkForCredentials()
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

    func checkForCredentials() {
        let defaults = UserDefaults.standard
        guard defaults.string(forKey: "Token") != nil else { return }
        let roleID = defaults.integer(forKey: "RoleID")

        print(roleID)

        switch roleID {
        case 1:
            let clientStoryboard = UIStoryboard(name: "ClientSignUp", bundle: nil)
            let clientVC = clientStoryboard.instantiateViewController(identifier: "clientVC")
            self.present(clientVC, animated: false, completion: nil)
        case 123:
            let instructorStoryboard = UIStoryboard(name: "InstructorSignUp", bundle: nil)
            let instructorVC = instructorStoryboard.instantiateViewController(identifier: "instructorVC")
            self.present(instructorVC, animated: false, completion: nil)
        default:
            NSLog("Error: invalid roleID provided")
        }
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

                    // Check whether they logged in as client or instructor with the 'roleID'
                    let roleID = credentials.roleID

                    // Save token to User Defaults
                    let token = credentials.token
                    let defaults = UserDefaults.standard
                    defaults.set(token, forKey: "Token")
                    defaults.set(roleID, forKey: "RoleID")

                    DispatchQueue.main.async {
                        switch roleID {
                        case 1:
                            let clientStoryboard = UIStoryboard(name: "ClientSignUp", bundle: nil)
                            let clientVC = clientStoryboard.instantiateViewController(identifier: "clientVC")
                            self.present(clientVC, animated: true, completion: nil)
                        case 123:
                            let instructorStoryboard = UIStoryboard(name: "InstructorSignUp", bundle: nil)
                            let instructorVC = instructorStoryboard.instantiateViewController(identifier: "instructorVC")
                            self.present(instructorVC, animated: true, completion: nil)
                        default:
                            NSLog("Error: invalid roleID provided")
                        }
                    }

                case .failure(let error):
                    DispatchQueue.main.async {
                        self.displayLogInErrorAlert()
                    }
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

    func displayLogInSuccessAlert() {
        let alertController = UIAlertController(title: "Logged In Successful!", message: "Welcome back", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        })
                   okAction.setValue(UIColor.black, forKey: "titleTextColor")
                   alertController.addAction(okAction)
                   present(alertController, animated: true, completion: nil)
    }

    func displayLogInErrorAlert() {
        let alertController = UIAlertController(title: "Error logging in!", message: "Please try again", preferredStyle: .alert)
                   let okAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
                   okAction.setValue(UIColor.black, forKey: "titleTextColor")
                   alertController.addAction(okAction)
                   present(alertController, animated: true, completion: nil)
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
            let instructorSignUpVC = segue.destination as? InstructorSignUpViewController
            instructorSignUpVC?.networkController = networkController
        } else if segue.identifier == "ClientSignUpSegue" {
            let clientSignUpVC = segue.destination as? ClientSignUpViewController
            clientSignUpVC?.networkController = networkController
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
