//
//  SettingView.swift
//  NemoCheck
//
//  Created by Oh Seojin on 8/26/25.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var viewModel: TabViewModel

    var body: some View {
        VStack {
            Button {
                viewModel.changeTab(from: 0, to: 1)
            } label: {
                Image(systemName: "arrow.left.arrow.right")
            }

        }
    }
}

#Preview {
    SettingView()
}
