//
//  feedback.swift
//  DUTodo
//
//  Created by 이동욱 on 2021/04/01.
//

import Foundation
import SwiftUI

// 햅틱 피드백 (파라미터 : 햅틱 강도)
func hapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    let impactMed = UIImpactFeedbackGenerator(style: .medium)
    impactMed.impactOccurred()
}
