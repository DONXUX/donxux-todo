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
    @Binding var isEditing: Bool
    
    init(task: Task, isEditing: Binding<Bool>) {
        _viewModel = StateObject(wrappedValue: TaskItemViewModel(task: task))
        self._isEditing = isEditing
    }
    
    var body: some View {
        return HStack {
            if isEditing {
                Text(viewModel.draftTitle)
            } else {
                DoneButton()
                TextField(viewModel.task.title, text: $viewModel.draftTitle, onCommit: viewModel.updateTask)
            }
        }
    }
    
    func DoneButton() -> some View {
        return ToggleButton(action: { viewModel.toggleDone() }, trueImage: "largecircle.fill.circle", check: viewModel.task.isDone)
    }
}
