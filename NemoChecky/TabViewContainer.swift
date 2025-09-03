//
//  ContentView.swift
//  NemoChecky
//
//  Created by Oh Seojin on 9/2/25.
//

import SwiftUI

protocol TabItemView: View, Identifiable {
    var id: Int { get set }  // 프로토콜 쓰는 방법
    var tabIcon: String { get }
    var tabTitle: String { get }
    var tabTag: Tab { get }
}

struct TabViewContainer: View {
    @StateObject var viewModel = TabViewModel()

    var body: some View {
        TabView {
            ForEach(viewModel.tabItems, id: \.id) { item in
                AnyView(item)
                    .tabItem {
                        Image(systemName: item.tabIcon)
                        Text(item.tabTitle)
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
