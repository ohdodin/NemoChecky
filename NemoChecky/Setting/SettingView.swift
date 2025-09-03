//
//  SettingView.swift
//  NemoCheck
//
//  Created by Oh Seojin on 8/26/25.
//

import SwiftUI

struct SettingView: TabItemView {
    var id = 4
    var tabIcon = "gearshape"
    var tabTitle = "설정"
    var tabTag = Tab.setting
    
    var body: some View {
        Text("SettiingView")
    }
}

#Preview {
    SettingView()
}

struct LeeoView: TabItemView {
    var id = 5
    var tabIcon = "setting"
    var tabTitle = "설정"
    var tabTag = Tab.setting
    
    var body: some View {
        Text("SettiingView")
    }
}
