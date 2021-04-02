//
//  TaskListView.swift
//  DUTodo
//
//  Created by 이동욱 on 2021/03/23.
//

import SwiftUI
import Foundation

// 할 일 리스트 뷰입니다.
struct TaskListView: View {
    @StateObject var viewModel: TaskListViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: TaskListViewModel())

    }
    
    var body: some View {
        return List(selection: $viewModel.selection) {
            if !viewModel.isEditing {
                TextField("새로운 할 일 입력...", text: $viewModel.draftTitle, onCommit: viewModel.createTask)
            }
            ForEach(viewModel.tasks) { task in
                TaskItemView(task: task, isEditing: $viewModel.isEditing)
            }
            .onMove(perform: viewModel.moveTask)
            .onDelete(perform: viewModel.deleteTask)
            .deleteDisabled(viewModel.isEditing)
            .animation(.default)
        }
        .toolbar {
            ToolbarMenu(hide: !viewModel.isEditing)
        }
        .environment(\.editMode, viewModel.isEditing ? .constant(.active) : .constant(.inactive))
        .navigationBarTitle(Text(viewModel.isEditing ? "\(viewModel.selection.count)개 선택" : "할 일 목록"))
        .navigationBarItems(trailing: Button(action: {
            viewModel.editingToggle()
        }) {
            EditingButton(isEditing: viewModel.isEditing)
        })
    }
    
    // 편집 버튼
    func EditingButton(isEditing: Bool) -> some View {
        return Text(isEditing ? "완료" : "편집")
    }
    
    // 툴바 메뉴
    func ToolbarMenu(hide: Bool) -> some ToolbarContent {
        let toolbarMenuContents = [
            ToolbarMenuContent(action: viewModel.onClickDeleteButton, image: "trash"),
        ]
        return ToolbarItem(placement: .bottomBar) {
            if !hide {
                HStack {
                    ForEach(toolbarMenuContents) { content in
                            ToolbarContent(action: content.action, systemName: content.image)
                    }
                }
            }
        }
    }
    
    // 툴바 요소
    func ToolbarContent(action: @escaping () -> Void, systemName: String) -> some View {
        Button(action: action) {
            Image(systemName: systemName)
        }
    }
}



