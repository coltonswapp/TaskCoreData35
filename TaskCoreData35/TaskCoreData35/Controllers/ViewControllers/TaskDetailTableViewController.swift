//
//  TaskDetailTableViewController.swift
//  TaskCoreData35
//
//  Created by Colton Swapp on 7/29/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var dueDateTextLabel: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    
    // MARK: - Properties
    // Landing Pad
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    var dueDate: Date?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateTextLabel.inputView = dueDatePicker
        dueDate = task?.due
        
        updateViews()
    }

    // MARK: - Actions
    // Save
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let taskName = taskNameTextField.text, !taskName.isEmpty,
            let dueDate = dueDate,
            let notes = notesTextView.text, !notes.isEmpty else { return }
        if let task = task {
            TaskController.sharedInstance.update(task: task, name: taskName, notes: notes, due: dueDate)
        } else {
            TaskController.sharedInstance.add(taskWithName: taskName, notes: notes, due: dueDate )
        }
        navigationController?.popViewController(animated: true)
    }
    
    // Cancel
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDateTextLabel.text = dueDatePicker.date.stringValue()
        dueDate = sender.date
    }
    
    @IBAction func userTappedView(_ sender: Any) {
        resignFirstResponder()
    }
    
    // Update Views Func
    func updateViews() {
        guard let task = task else { return }
        loadViewIfNeeded()
        taskNameTextField.text = task.taskName
        dueDateTextLabel.text = task.due?.stringValue()
        notesTextView.text = task.notes
        dueDatePicker.date = task.due ?? Date()
        
    }
    
   
}
