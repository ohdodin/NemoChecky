//
//  TabViewModel.swift
//  NemoChecky
//
//  Created by Oh Seojin on 9/2/25.
//

import Foundation

enum Tab: String, Hashable {
    case today, list, calendar, report, setting
}

@MainActor
class TabViewModel: ObservableObject {
    @Published var selectedTab: Tab = .today
    @Published var tabItems: [any TabItemView] = [
        TodayView(), ListView(), CalendarView(), ReportView(), SettingView(),
    ]

    func changeTab(from source: Int, to destination: Int) {
        tabItems.swapAt(source, destination)
    }
}
