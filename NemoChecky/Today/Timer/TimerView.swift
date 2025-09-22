//
//  TimerView.swift
//  NemoChecky
//
//  Created by Oh Seojin on 9/7/25.
//

import SwiftUI

struct TimerView: View {
    enum Constant {
        static let lineWidth: CGFloat = 40
        static let tickLineWidth: CGFloat = 2
        static let tickBoldLineWidth: CGFloat = 3
        static let tickLineHeight: CGFloat = 10
        static let tickBoldLineHeight: CGFloat = 24
        static let maximumValue: Int = 12
    }

    @StateObject private var viewModel = TimerViewModel()
    var item: TaskItem

    var body: some View {
        ZStack {
            Color(.midnightBlue01)
                .ignoresSafeArea()
            VStack {
                if viewModel.isDone {
                    CircleTimerView(
                        viewModel: viewModel,
                        item: item
                    )
                } else if !viewModel.isActive {
                    Text(String(viewModel.countdown))
                        .font(
                            .system(size: 60, weight: .bold, design: .default)
                        )
                        .foregroundColor(.white)
                } else {
                    CircleTimerView(
                        viewModel: viewModel,
                        item: item
                    )
                }
                if viewModel.isDone {
                    Button {
                        Task {
                            await viewModel.countThree()
                            viewModel.startTimer()
                        }
                    } label: {
                        Circle()
                            .fill(.white)
                            .frame(width: 80, height: 80)
                            .overlay {
                                Image(systemName: "play.fill")
                                    .font(.largeTitle)
                            }
                    }
                }
                if viewModel.isActive {
                    Button {
                        Task {
                            viewModel.stopTimer()
                        }
                    } label: {
                        Circle()
                            .fill(.white)
                            .frame(width: 80, height: 80)
                            .overlay {
                                Image(systemName: "stop.fill")
                                    .font(.largeTitle)
                            }
                    }
                }
            }
            .padding(30)
        }
        .accentColor(.midnightYellow01)
    }

    struct CircleTimerView: View {
        @ObservedObject var viewModel: TimerViewModel
        let item: TaskItem

        var body: some View {
            ZStack {
                ZStack {
                    ForEach(1...60, id: \.self) { index in
                        Rectangle()
                            .fill(.midnightSora03)
                            .frame(
                                width: index % 5 == 0
                                    ? Constant.tickBoldLineWidth
                                    : Constant.tickLineWidth,
                                height: index % 5 == 0
                                    ? Constant.tickBoldLineHeight
                                    : Constant.tickLineHeight
                            )
                            .offset(
                                y: (viewModel.size
                                    - Constant.lineWidth) / 2
                            )
                            .rotationEffect(.init(degrees: Double(index) * 6))
                    }
                }

                Circle()
                    .stroke(
                        viewModel.angle <= 360 ? .gray : .midnightYellow01,
                        style: StrokeStyle(
                            lineWidth: Constant.lineWidth,
                            lineCap: .round,
                            lineJoin: .round
                        )
                    )
                    .frame(width: viewModel.size, height: viewModel.size)

                // Progress
                Circle()
                    .trim(
                        from: 0,
                        to: viewModel.progress > 0.5
                            ? (viewModel.progress - 0.5) * 2
                            : viewModel.progress * 2
                    )
                    .stroke(
                        viewModel.angle <= 360
                            ? .midnightYellow01 : .midnightMint01,
                        style: StrokeStyle(
                            lineWidth: Constant.lineWidth,
                            lineCap: .round,
                            lineJoin: .round
                        )
                    )
                    .frame(width: viewModel.size, height: viewModel.size)
                    .rotationEffect(.init(degrees: -90))

                // Point
                ForEach(0..<Constant.maximumValue, id: \.self) {
                    item in
                    if item <= Int(viewModel.angle / 30) {
                        Text("•")
                            .bold()
                            .offset(y: -viewModel.size / 2)
                            .rotationEffect(.degrees(Double(30) * Double(item)))
                            .foregroundStyle(.white)

                    }
                }

                // Drag Circle
                Circle()
                    .fill(.white)
                    .frame(
                        width: Constant.lineWidth,
                        height: Constant.lineWidth
                    )
                    .offset(x: viewModel.size / 2)
                    .rotationEffect(.degrees(viewModel.angle))
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: 0.3)) {
                                    viewModel.onDrag(value: value)
                                }
                            }
                            .onEnded { _ in
                                let snapped = viewModel.snappedAngle(
                                    from: viewModel.angle
                                )
                                withAnimation {
                                    viewModel.angle = snapped
                                    viewModel.progress = snapped / 720
                                }
                            }
                    )
                    .rotationEffect(.init(degrees: -90))

                Text(viewModel.displayTime)
                    .font(.largeTitle)
                    .foregroundStyle(Color(.white))
            }
            .padding(.bottom, 60)
        }
    }

    struct PickerRow: View {
        let text: String
        var body: some View {
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 40))
        }
    }

}

#Preview {
    let item: TaskItem = TaskItem(
        title: "C6",
        totalTime: "10:00",
        currentTime: "10:00",
        iconName: "Icon01",
        colorScheme: .yellow
    )

    TimerView(item: item)
}
