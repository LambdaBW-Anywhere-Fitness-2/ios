//
//  CreateClassViewController.swift
//  AnywhereFitness
//
//  Created by Kenneth Jones on 6/24/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class CreateClassViewController: UIViewController {
    
    var classController: ClassController?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var intensityControl: UISegmentedControl!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var maxSizeTextField: UITextField!
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let fitnessClass = classController,
            let name = nameTextField.text,
            !name.isEmpty,
            let type = typeTextField.text,
            !type.isEmpty,
            let startTime = startTextField.text,
            !startTime.isEmpty,
            let startDate = startTextField.text,
            let durationString = durationTextField.text,
            !durationString.isEmpty,
            let duration = Int64(durationString),
            let intensity = intensityControl.titleForSegment(at: intensityControl.selectedSegmentIndex),
            let location = locationTextField.text,
            !location.isEmpty,
            let maxClassSizeString = maxSizeTextField.text,
            let maxClassSize = Int64(maxClassSizeString)
        else { return }
        
        // TODO: - Get dates from date and time picker
//        let fitnessClass = FitnessClass(name: name,
//        type: ClassType(rawValue: type)!,
//        startTime: Date(),
//        startDate: Date(),
//        duration: duration,
//        intensity: Intensity(rawValue: intensity)!,
//        location: location,
//        numOfAttendees: 0,
//        maxClassSize: maxClassSize)
//        
//        classController?.createClass(fitnessClass: fitnessClass)
        
        do {
            try CoreDataStack.shared.mainContext.save()
        } catch {
            NSLog("Error saving managed object context: \(error)")
        }
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        nameTextField.text = ""
        typeTextField.text = ""
        startTextField.text = ""
        durationTextField.text = ""
        intensityControl.isEnabledForSegment(at: 0)
        locationTextField.text = ""
        maxSizeTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
