//
//  TaskItemViewModel.swift
//  DUTodo
//
//  Created by 이동욱 on 2021/04/01.
//

import Foundation
import SwiftUI

// 할 일 리스트 아이템 뷰 모델입니다.
extension TaskItemView {
    class TaskItemViewModel: ObservableObject {
        @Published var task: Task
        @Published var draftTitle: String
        
        init(task: Task) {
            self.task = task
            self.draftTitle = task.title
        }

        func updateTask() {
            task = Task.update(task: task, draftTitle: draftTitle)
        }
        
        func toggleDone() {
            hapticFeedback(style: .medium)
            task = Task.toggleDone(task: task)
        }
    }
}
