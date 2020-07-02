//
//  HomePageViewController.swift
//  AnywhereFitness
//
//  Created by Josh Kocsis on 6/19/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var homePageImageView: UIImageView!
    @IBOutlet weak var logOutButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
    }

    func setUpViews() {
        view.backgroundColor = .smokyBlack
        homePageImageView.alpha = 0.2

        // Log out button
        logOutButton.tintColor = .subtleRed
    }

    @IBAction func logOutButtonTapped(_ sender: UIBarButtonItem) {
        let defaults = UserDefaults.standard
        defaults.set(nil, forKey: "Token")
        defaults.set(nil, forKey: "RoleID")
        self.dismiss(animated: true, completion: nil)
    }

}
