//
//  Today.swift
//  NemoCheck
//
//  Created by Oh Seojin on 8/27/25.
//

import SwiftUI

struct TodayView: View {
    @StateObject private var viewModel = TodayViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                HeaderView()
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.taskItems, id: \.self) { item in
                            TaskItemView(item: item)
                        }
                    }
                    .padding(20)
                }
            }
            .navigationTitle("Today")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                    } label: {
                        Image(systemName: "pencil.and.list.clipboard")
                    }.foregroundStyle(.midnightYellow01)

                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                    } label: {
                        Image(systemName: "plus.circle")
                    }.foregroundStyle(.midnightYellow01)

                }
            }
            .navigationBarStyle()
        }
    }

    struct HeaderView: View {
        var body: some View {
            ZStack {
                Color(.midnightBlue01)
                HStack {

                    Grid(
                        alignment: .center,
                        horizontalSpacing: 0,
                        verticalSpacing: 0
                    ) {
                        ForEach(0..<4) { i in
                            GridRow {
                                Text(String(format: "%02d", i * 6))
                                    .font(.caption)
                                    .padding(.trailing, 8)
                                ForEach(0..<12) { _ in
                                    Rectangle()
                                        .fill(.midnightBlue03)
                                        .stroke(.midnightSora03, lineWidth: 1)
                                        .frame(width: 24, height: 24)
                                }
                            }
                        }

                    }
                    .foregroundStyle(.midnightSora03)
                    .frame(width: 320)
                }.padding(24)
            }
            .frame(height: 144)
        }
    }

    struct TaskItemView: View {
        var item: TaskItem

        var body: some View {
            NavigationLink(destination: TimerView(item: item)) {
                ZStack {
                    RoundedRectangle(cornerSize: .init(width: 16, height: 16))
                        .fill(item.colorScheme.backgroundColor)
                        .stroke(item.colorScheme.pointColor, lineWidth: 1)
                    HStack(spacing: 8) {
                        Image(item.iconName)
                            .resizable()
                            .frame(width: 45, height: 45)
                            .font(.title)
                            .cornerRadius(100)
                        Text(item.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(item.currentTime)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                }
                .padding(.bottom, 16)
                .foregroundStyle(.midnightDark01)
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var viewModel = TabViewModel()
    TodayView()
        .environmentObject(viewModel)
}
