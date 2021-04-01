//
//  TaskItemView.swift
//  DUTodo
//
//  Created by 이동욱 on 2021/03/30.
//

import Foundation
import SwiftUI

// Task item View
struct TaskItemView: View {
    @StateObject private var viewModel: TaskItemViewModel
    
    init(task: Task) {
        _viewModel = StateObject(wrappedValue: TaskItemViewModel(task: task))
    }
    
    var body: some View {
        return HStack {
            // Done Button
            Button(action: { viewModel.toggleDone() }) {
                doneImage(done: viewModel.task.isDone)
            }
            // List Item
            TextField(viewModel.task.title, text: $viewModel.draftTitle, onCommit: viewModel.updateTask)
        }
    }
}

func doneImage(done: Bool) -> some View {
    return Image(systemName: done ? "largecircle.fill.circle" : "circle")
        .resizable()
        .foregroundColor(done ? .green : .gray)
        .frame(width: 24.0, height: 24.0)
}
