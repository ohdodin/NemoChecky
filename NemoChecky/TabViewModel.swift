//
//  TabViewModel.swift
//  NemoChecky
//
//  Created by Oh Seojin on 9/2/25.
//

import Foundation
import SwiftUI

@MainActor
class TabViewModel: ObservableObject {
    @Published var selectedTab: TabTag = .today
    @Published var tabItems: [TabItem] = [
        TabItem(id: 0, tabTag: TabTag.today),
        TabItem(id: 1, tabTag: TabTag.list),
        TabItem(id: 2, tabTag: TabTag.calendar),
        TabItem(id: 3, tabTag: TabTag.report),
        TabItem(id: 4, tabTag: TabTag.setting),
    ]

    func changeTab(from source: Int, to destination: Int) {
        tabItems.swapAt(source, destination)
    }
}

struct TabItem: Identifiable {
    var id: Int
    var tabTag: TabTag
}

enum TabTag: String, Hashable {
    case today, list, calendar, report, setting
    
    var iconName: String {
        switch self {
        case .today:
            return "clock"
        case .list:
            return "list.triangle"
        case .calendar:
            return "calendar"
        case .report:
            return "chart.pie"
        case .setting:
            return "gearshape"
        }
    }
    
    var title: String {
        switch self {
        case .today:
            return "오늘"
        case .list:
            return "기록"
        case .calendar:
            return "캘린더"
        case .report:
            return "리포트"
        case .setting:
            return "설정"
        }
    }
}

extension TabTag {
    @ViewBuilder
    var content: some View {
        switch self {
        case .today:    TodayView()
        case .list:     ListView()
        case .calendar: CalendarView()
        case .report:   ReportView()
        case .setting:  SettingView()
        }
    }
}
