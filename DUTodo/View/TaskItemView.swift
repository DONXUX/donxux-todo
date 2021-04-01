//
//  TaskItemView.swift
//  DUTodo
//
//  Created by 이동욱 on 2021/03/30.
//

import Foundation
import SwiftUI

// 할 일 리스트 아이템 뷰입니다.
// 각 뷰의 요소를 나타냅니다.
struct TaskItemView: View {
    @StateObject private var viewModel: TaskItemViewModel
    
    init(task: Task) {
        _viewModel = StateObject(wrappedValue: TaskItemViewModel(task: task))
    }
    
    var body: some View {
        return HStack {
            Button(action: { viewModel.toggleDone() }) {
                DoneIcon(done: viewModel.task.isDone)
            }
            TextField(viewModel.task.title, text: $viewModel.draftTitle, onCommit: viewModel.updateTask)
        }
    }
}

// 할 일 완료 아이콘
func DoneIcon(done: Bool) -> some View {
    return Image(systemName: done ? "largecircle.fill.circle" : "circle")
        .resizable()
        .foregroundColor(done ? .green : .gray)
        .frame(width: 24.0, height: 24.0)
}
