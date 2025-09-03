//
//  NemoCheckApp.swift
//  NemoCheck
//
//  Created by Oh Seojin on 8/26/25.
//

import SwiftUI

@main
struct NemoCheckyApp: App {
    @StateObject private var viewModel = TabViewModel()

    var body: some Scene {
        WindowGroup {
            TabViewContainer()
        }
    }
}

