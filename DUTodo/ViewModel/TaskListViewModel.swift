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
        @Published var selection = Set<UUID>()
        


        init() {
            self.tasks = Task.read()
//            toolbarMenuContents = [
//                ToolbarMenuContent(action: self.onClickDeleteButton, image: "trash"),
//            ]
        }

        func createTask() {
            tasks = Task.create(task: Task(title: self.draftTitle, isDone: false))
            self.draftTitle = ""
        }
        
        func deleteTask(at offsets: IndexSet) {
            tasks = Task.delete(at: offsets)
        }
        
        func moveTask(from source: IndexSet, to destination: Int) {
            tasks = Task.move(from: source, to: destination)
        }
        
        // 편집 버튼 토글 이벤트입니다.
        func editingToggle() {
            hapticFeedback(style: .medium)
            selection = Set<UUID>()
            isEditing.toggle()
        }
        
        // 툴바 삭제 버튼 이벤트입니다.
        // 선택된 할 일을 삭제합니다.
        func onClickDeleteButton() {
            var indexSet = IndexSet([])
            for id in selection {
                if let index = tasks.firstIndex(where: {$0.id == id}) {
                    indexSet.insert(index)
                }
            }
            tasks = Task.delete(at: indexSet)
            selection = Set<UUID>()
        }
    }
}
