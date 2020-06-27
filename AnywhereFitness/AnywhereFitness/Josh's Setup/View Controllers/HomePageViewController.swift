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
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

    @IBAction func logOutButtonTapped(_ sender: UIBarButtonItem) {
        #warning("implement log out feature")
    }

}
