//
//  InstructorHomePageViewController.swift
//  AnywhereFitness
//
//  Created by Matthew Martindale on 6/28/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class InstructorHomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logOutButtonTapped(_ sender: UIBarButtonItem) {
        let defaults = UserDefaults.standard
        defaults.set(nil, forKey: "Token")
        defaults.set(nil, forKey: "RoleID")
        self.dismiss(animated: true, completion: nil)
    }

}
