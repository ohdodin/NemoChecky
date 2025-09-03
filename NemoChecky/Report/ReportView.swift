//
//  ReportView.swift
//  NemoCheck
//
//  Created by Oh Seojin on 8/26/25.
//

import SwiftUI

struct ReportView: TabItemView {
    var id = 3
    var tabIcon = "chart.bar.fill"
    var tabTitle = "리포트"
    var tabTag = Tab.report
    
    var body: some View {
        Text("ReportView")
    }
}

#Preview {
    ReportView()
}
