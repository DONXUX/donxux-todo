//
//  Icon.swift
//  DUTodo
//
//  Created by 이동욱 on 2021/04/01.
//

import Foundation
import SwiftUI

func ToggleButton(
    action: @escaping () -> Void,
    trueImage: String,
    trueColor: Color = .green,
    falseImage: String = "circle",
    falseColor: Color = .gray,
    check: Bool = false
) -> some View {
    return Button(action: action) {
        Image(systemName: check ? trueImage : falseImage)
            .resizable()
            .foregroundColor(check ? trueColor : falseColor)
            .frame(width: 22.0, height: 22.0)
    }
}
