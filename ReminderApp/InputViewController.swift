//
//  InputViewController.swift
//  ReminderApp
//
//  Created by Arnau Vives on 17/10/22.
//

import UIKit

class InputViewController: UIViewController {
    @IBOutlet weak var taskNameField: UITextField!
    
    @IBOutlet weak var taskStatusField: UITextField!
    
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var taskCallback : (_ task: Task) -> Void = { arg in }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonActionHandler(_ sender: Any) {
        let task = Task(taskName: taskNameField.text!, taskStatus: false, assignedTo: taskStatusField.text!, date: datePicker.date)
        taskCallback(task)
        dismiss(animated: true)
    }
    
}
