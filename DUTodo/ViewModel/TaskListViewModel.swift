//
//  TaskListViewModel.swift
//  DUTodo
//
//  Created by 이동욱 on 2021/04/01.
//

import Foundation
import SwiftUI

extension TaskListView {
    class TaskListViewModel: ObservableObject {
        @Published var tasks: [Task]
        @Published var draftTitle: String = ""
        @Published var isEditing: Bool = false
        
        init() {
            self.tasks = UserData().tasks
        }
        
        func editingToggle() {
            hapticFeedback(style: .medium)
            isEditing.toggle()
        }
                
        // Create Task
        func createTask() {
            let newTask = Task(title: self.draftTitle, isDone: false)
            tasks = Task.create(task: newTask)
            self.draftTitle = ""
        }
        
        // Delete Task
        func deleteTask(at offsets: IndexSet) {
            tasks = Task.delete(at: offsets)
        }
    }
}
