//
//  TaskListViewModel.swift
//  DUTodo
//
//  Created by 이동욱 on 2021/04/01.
//

import Foundation
import SwiftUI

// 할 일 리스트 뷰 모델입니다.
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
                
        func createTask() {
            let newTask = Task(title: self.draftTitle, isDone: false)
            tasks = Task.create(task: newTask)
            self.draftTitle = ""
        }
        
        func deleteTask(at offsets: IndexSet) {
            tasks = Task.delete(at: offsets)
        }
    }
}
