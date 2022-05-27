//
//  Delegates.swift
//  To-Do-List
//
//  Created by Igor Korovyanskiy on 26.05.2022.
//

import Foundation

protocol SaveUserTaskDelegate: class {
  func saveTask(task: TaskModel)
}
protocol RemoveTaskDelegate: class {
  func removeTask(task: TaskModel)
}
 
protocol TaskCompletedDelegate: class {
  func taskComplet(task: TaskModel)
}

weak var saveTaskDeleagate: SaveUserTaskDelegate?

extension TaskListTVC: SaveUserTaskDelegate {
  func saveTask(task: TaskModel) {
    arrayUserTasks.append(task)
    tableView.reloadData()
  }
}
extension TaskListTVC: RemoveTaskDelegate {
  func removeTask(task: TaskModel) {
    guard let taskByIndex = task.currentIndex?.item else { return }
    arrayUserTasks.remove(at: taskByIndex)
    tableView.reloadData()
  }
}
 
extension TaskListTVC: TaskCompletedDelegate {
  func taskComplet(task: TaskModel) {
    guard let taskByIndex = task.currentIndex?.item else { return }
    arrayUserTasks[taskByIndex].taskCellColor = #colorLiteral(red: 0.4666666667, green: 0.7607843137, blue: 0.7019607843, alpha: 1)
    tableView.reloadData()
  }
}
