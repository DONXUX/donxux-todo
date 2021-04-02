//
//  ToolbarMenu.swift
//  DUTodo
//
//  Created by 이동욱 on 2021/04/01.
//

import Foundation
import SwiftUI

struct ToolbarMenuContent: Identifiable {
    let id: UUID
    let action: () -> Void
    let image: String
    
    init(action: @escaping () -> Void, image: String) {
        self.id = UUID()
        self.action = action
        self.image = image
    }
}
