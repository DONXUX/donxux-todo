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
    
    // Create task
    public static func create(task: Task) -> [Task] {
        let userData: UserData = UserData()
        if task.title != "" {
            userData.tasks.insert(task, at: 0)
        }
        return userData.tasks
    }
    
    // Update task
    public static func update(task: Task, draftTitle: String) -> Task {
        guard let index = UserData().tasks.firstIndex(of: task) else { return Task(title: "", isDone: false) }
        UserData().tasks[index].title = draftTitle
        return UserData().tasks[index]
    }
    
    // Delete task
    public static func delete(at offsets: IndexSet) -> [Task] {
        UserData().tasks.remove(atOffsets: offsets)
        return UserData().tasks
    }
    
    // Toggle done
    public static func toggleDone(task: Task) -> Task {
        guard let index = UserData().tasks.firstIndex(where: { $0.id == task.id }) else { return Task(title: "", isDone: false) }
        UserData().tasks[index].isDone.toggle()
        return UserData().tasks[index]
    }
}
