//
//  LandingPageViewController.swift
//  AnywhereFitness
//
//  Created by Matthew Martindale on 6/17/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {
    
    
    @IBOutlet weak var landingPageImageView: UIImageView!
    @IBOutlet weak var tagLineLabel: UILabel!
    @IBOutlet weak var clientButton: UIButton!
    @IBOutlet weak var instructorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
    }
    
    func setUpViews() {
        // Background Image
        view.backgroundColor = .smokyBlack
        landingPageImageView.alpha = 0.2
        
        // Buttons
        clientButton.backgroundColor = .pacificBlue
        clientButton.layer.cornerRadius = clientButton.frame.size.height / 5
        instructorButton.backgroundColor = .offWhite
        instructorButton.layer.cornerRadius = instructorButton.frame.size.height / 5
        
        // Labels
        tagLineLabel.textColor = .pacificBlue
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
