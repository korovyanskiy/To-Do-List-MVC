//
//  TaskVC.swift
//  To-Do-List
//
//  Created by Igor Korovyanskiy on 26.05.2022.
//

import UIKit

class TaskVC: UIViewController {

    @IBOutlet weak var userTaskField: UITextField!
    
    weak var saveTaskDeleagate: SaveUserTaskDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveTaskBtnPressed(_ sender: Any) {
        if let task = userTaskField.text {
                if !task.isEmpty {
                  let task = TaskModel(taskName: task, taskCellColor: .white)
                  saveTaskDeleagate?.saveTask(task: task)
                  dismiss(animated: true, completion: nil)
                }
              }
    }
    
}
