//
//  ContentView.swift
//  NemoChecky
//
//  Created by Oh Seojin on 9/2/25.
//

import SwiftUI

struct TabViewContainer: View {
    @StateObject var viewModel = TabViewModel()

    var body: some View {
        TabView {
            ForEach(viewModel.tabItems, id: \.id) { item in
                item.tabTag.content
                    .tabItem {
                        Image(systemName: item.tabTag.iconName)
                        Text(item.tabTag.title)
                    }
                    .tag(item.tabTag)
            }

        }
        .environmentObject(viewModel)
    }
}

#Preview {
    TabViewContainer()
}
