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
            ZStack {
                Color(.secondarySystemBackground)
                    .ignoresSafeArea()
                VStack {
                    HeaderView()
                    List {
                        ForEach(viewModel.taskItems, id: \.self) { item in
                            TaskItemView(item: item)
                        }
                        .listRowBackground(Color.white)
                    }
                    .listStyle(.plain)
                    AddTaskButton()
                }
                .navigationTitle("Today")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                        } label: {
                            Image(systemName: "pencil.and.list.clipboard")
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                    }
                }
            }
        }
    }

    struct HeaderView: View {
        var body: some View {
            HStack(spacing: 10) {
                Text("Header")
            }
            .frame(maxWidth: .infinity, maxHeight: 92)
            .padding(10)
            .background(.purple)
            .cornerRadius(15)
            .padding(20)

        }
    }

    struct TaskItemView: View {
        var item: TaskItem
        
        var body: some View {
            HStack(spacing: 8) {
                Image(systemName: "star")
                    .font(.title)
                VStack(alignment: .leading) {
                    Text(item.title)
                    Text(item.totalTime)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text(item.currentTime)
            }
            .onTapGesture {_ in
                print(item.title)
            }
        }
    }
    
    struct AddTaskButton: View {
        var body: some View {
            Button {
                print("작업 추가하기")
            } label: {
                HStack {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                    Text("작업 추가하기")
                        .foregroundColor(.white)
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 24)
                .background(.blue)
                .cornerRadius(100)

            }
        }
    }

}

#Preview {
    @Previewable @StateObject var viewModel = TabViewModel()
    TodayView()
        .environmentObject(viewModel)
}
