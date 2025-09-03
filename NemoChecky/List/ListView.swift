//
//  ListView.swift
//  NemoCheck
//
//  Created by Oh Seojin on 8/26/25.
//

import SwiftUI

struct ListView: TabItemView {
    var id = 1
    var tabIcon = "list.triangle"
    var tabTitle = "기록"
    var tabTag = Tab.list
    
    var body: some View {
        VStack {
            Text("\(id)")
            Text("ListView")
        }
    }
}

#Preview {
    ListView()
}
