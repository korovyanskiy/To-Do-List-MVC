//
//  TaskListTVC.swift
//  To-Do-List
//
//  Created by Igor Korovyanskiy on 26.05.2022.
//

import UIKit

class TaskListTVC: UITableViewController {
    var arrayUserTasks = [TaskModel]()
    var vc = TaskVC()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func showTaskVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "TaskVC") as! TaskVC
        vc.saveTaskDeleagate = self
        present(vc, animated: true, completion: nil)
      }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUserTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as? TaskCell else { return UITableViewCell() }
        arrayUserTasks[indexPath.row].currentIndex = indexPath
        let task = arrayUserTasks[indexPath.row]
        cell.cellData(task: task)
        cell.removeTaskDelegate = self
        cell.taskCompletedDelegate = self
        return cell
        
      }
    
    
    }
