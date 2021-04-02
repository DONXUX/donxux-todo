//
//  File.swift
//  DUTodo
//
//  Created by 이동욱 on 2021/03/23.
//

import SwiftUI
import Foundation

struct Task: Codable, Identifiable, Equatable, Hashable {
    let id: UUID
    var title: String
    var isDone: Bool
    
    init(title: String, isDone: Bool) {
        self.id = UUID()
        self.title = title
        self.isDone = isDone
    }
    
    // 저장소에 할 일을 추가합니다.
    // 할 일 리스트를 반환합니다.
    public static func create(task: Task) -> [Task] {
        let userData = UserData()
        if task.title != "" {
            userData.tasks.insert(task, at: 0)
        }
        return userData.tasks
    }

    // 저장소에서 할 일을 불러옵니다.
    // 할 일 리스트를 반환합니다.
    public static func read() -> [Task] {
        return UserData().tasks
    }
    
    // 저장소에 지정한 할 일을 수정합니다.
    // 수정된 할 일만 반환합니다.
    public static func update(task: Task, draftTitle: String) -> Task {
        let userData = UserData()
        guard let index = userData.tasks.firstIndex(of: task) else { return Task(title: "", isDone: false) }
        userData.tasks[index].title = draftTitle
        return userData.tasks[index]
    }
    
    // 저장소에 지정한 할 일을 삭제합니다.
    // 할 일 리스트를 반환합니다.
    public static func delete(at offsets: IndexSet) -> [Task] {
        let userData = UserData()
        userData.tasks.remove(atOffsets: offsets)
        return userData.tasks
    }
    
    // 저장소에 지정한 할 일의 순서를 바꿉니다.
    // 할 일 리스트를 반환합니다.
    public static func move(from source: IndexSet, to destination: Int) -> [Task] {
        let userData = UserData()
        userData.tasks.move(fromOffsets: source, toOffset: destination)
        return userData.tasks
    }
    
    // 저장소에 지정한 할 일의 완료 여부를 변환합니다.
    // 수정된 할 일만 반환합니다.
    public static func toggleDone(task: Task) -> Task {
        let userData = UserData()
        guard let index = userData.tasks.firstIndex(where: { $0.id == task.id }) else { return Task(title: "", isDone: false) }
        userData.tasks[index].isDone.toggle()
        return userData.tasks[index]
    }
}
