//
//  TaskItemViewModel.swift
//  DUTodo
//
//  Created by 이동욱 on 2021/04/01.
//

import Foundation
import SwiftUI

extension TaskItemView {
    class TaskItemViewModel: ObservableObject {
        @Published var task: Task
        @Published var draftTitle: String
        
        init(task: Task) {
            self.task = task
            self.draftTitle = task.title
        }
 
        func toggleDone() {
            hapticFeedback(style: .medium)
            task = Task.toggleDone(task: task)
        }
        
        func updateTask() {
            task = Task.update(task: task, draftTitle: draftTitle)
        }

    }
}
