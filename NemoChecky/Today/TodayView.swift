//
//  Today.swift
//  NemoCheck
//
//  Created by Oh Seojin on 8/27/25.
//

import SwiftUI

struct TodayView: TabItemView {
    @EnvironmentObject var viewModel: TabViewModel
    
    var id = 0
    var tabIcon = "clock"
    var tabTitle = "오늘"
    var tabTag = Tab.today
    
    var body: some View {
        VStack {
            Text("\(id)")
            Button {
                viewModel.changeTab(from: 0, to: 1)
            } label: {
                Image(systemName: "arrow.left.arrow.right")
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var viewModel = TabViewModel()
    TodayView()
        .environmentObject(viewModel)
}
