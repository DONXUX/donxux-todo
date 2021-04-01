//
//  TaskListView.swift
//  DUTodo
//
//  Created by 이동욱 on 2021/03/23.
//

import SwiftUI
import Foundation

// Task list View
struct TaskListView: View {
    @StateObject var viewModel: TaskListViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: TaskListViewModel())
    }
    
    var body: some View {
        return List {
            TextField("새로운 할 일 입력...", text: $viewModel.draftTitle, onCommit: viewModel.createTask)
            ForEach(viewModel.tasks) { task in
                TaskItemView(task: task)
            }
            .onDelete(perform: viewModel.deleteTask)
        }
        .navigationBarTitle(Text("Tasks"))
        .navigationBarItems(trailing: Button(action: {
            viewModel.editingToggle()
        }) {
            editingButton(isEditing: viewModel.isEditing)
        })
    }
}

func editingButton(isEditing: Bool) -> some View {
    return Text(isEditing ? "완료" : "편집")
}
