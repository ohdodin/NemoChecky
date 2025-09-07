//
//  StyledExtension.swift
//  NemoChecky
//
//  Created by Oh Seojin on 9/6/25.
//

import SwiftUI

extension View {
    func navigationBarStyle() -> some View {
        self
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color.midnightBlue01, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}
