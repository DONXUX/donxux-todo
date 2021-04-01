//
//  UserData.swift
//  DUTodo
//
//  Created by 이동욱 on 2021/03/23.
//

import Combine
import SwiftUI
import Foundation

// Default task data
private let defaultTasks: [Task] = [
    Task(title: "SwiftUI 배우기", isDone: false),
    Task(title: "WWDC 보기", isDone: true),
]

/// TODO: Need to system linking to API server.
final class UserData: ObservableObject {
    @LinkStorage(key: "Tasks", defaultValue: defaultTasks)
    var tasks: [Task]
}
