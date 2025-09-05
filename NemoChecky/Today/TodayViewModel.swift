//
//  TodayViewModel.swift
//  NemoChecky
//
//  Created by Oh Seojin on 9/4/25.
//

import Foundation

struct TaskItem: Hashable {
    var title: String
    var totalTime: String
    var currentTime: String
}

final class TodayViewModel: ObservableObject {
    @Published var taskItems: [TaskItem] = [
        TaskItem(title: "C6", totalTime: "10:00", currentTime: "10:00"),
        TaskItem(title: "사이드 프로젝트", totalTime: "00:00", currentTime: "00:00"),
        TaskItem(title: "리이오 멘토링", totalTime: "00:00", currentTime: "00:00"),
    ]
}
