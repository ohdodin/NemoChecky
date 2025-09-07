//
//  TodayViewModel.swift
//  NemoChecky
//
//  Created by Oh Seojin on 9/4/25.
//

import SwiftUI

enum ColorScheme: String {
    case yellow, green, mint, sora, pink
    
    var backgroundColor: Color {
        switch self {
        case .yellow: return Color.midnightYellow04
        case .green: return Color.midnightGreen04
        case .mint: return Color.midnightMint04
        case .sora: return Color.midnightSora04
        case .pink: return Color.midnightPink04
        }
    }
    
    var pointColor: Color {
        switch self {
        case .yellow: return Color.midnightYellow01
        case .green: return Color.midnightGreen01
        case .mint: return Color.midnightMint01
        case .sora: return Color.midnightSora01
        case .pink: return Color.midnightPink01
        }
    }
}

struct TaskItem: Hashable {
    var title: String
    var totalTime: String
    var currentTime: String
    var iconName: String
    var colorScheme: ColorScheme
}

final class TodayViewModel: ObservableObject {
    @Published var taskItems: [TaskItem] = [
        TaskItem(title: "C6", totalTime: "10:00", currentTime: "10:00", iconName: "Icon01", colorScheme: .pink),
        TaskItem(title: "사이드 프로젝트", totalTime: "00:00", currentTime: "00:00", iconName: "Icon02", colorScheme: .yellow),
        TaskItem(title: "리이오 멘토링", totalTime: "00:00", currentTime: "00:00", iconName: "Icon02", colorScheme: .sora),
    ]
}
