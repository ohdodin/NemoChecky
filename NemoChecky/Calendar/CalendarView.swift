//
//  CalendarView.swift
//  NemoCheck
//
//  Created by Oh Seojin on 8/26/25.
//

import SwiftUI

struct CalendarView: TabItemView {
    var id = 2
    var tabIcon = "calendar"
    var tabTitle = "캘린더"
    var tabTag = Tab.calendar
    
    var body: some View {
        Text("CalendarView")
    }
}

#Preview {
    CalendarView()
}
