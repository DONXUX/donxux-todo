//
//  UserData.swift
//  DUTodo
//
//  Created by 이동욱 on 2021/03/23.
//

import Combine
import SwiftUI
import Foundation

// 디폴트 데이터
private let defaultTasks: [Task] = [
    Task(title: "SwiftUI 배우기", isDone: false),
    Task(title: "WWDC 보기", isDone: true),
]

/// TODO: API 서버와 연동
final class UserData: ObservableObject {
    @LinkStorage(key: "Tasks", defaultValue: defaultTasks)
    var tasks: [Task]
}
