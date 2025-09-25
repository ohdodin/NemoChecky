//
//  TimerViewModel.swift
//  NemoChecky
//
//  Created by Oh Seojin on 9/7/25.
//

import Foundation
import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var angle: Double = 0
    @Published var progress: CGFloat = 0
    @Published var size = UIScreen.main.bounds.width - 100

    @Published var isActive: Bool = false
    @Published var isPause: Bool = false
    @Published var isDone: Bool = true
    @Published var countdown: Int = 3

    private var timer: Timer?
    private var secondsPerDegree = 10.0
    private var maxTurns = 2
    private var maxAngle: Double { 360.0 * Double(maxTurns) }
    private var maxSeconds: Int { Int(maxAngle * secondsPerDegree) }

    var totalSecons: Int {
        get { Int(round(angle * secondsPerDegree)) }
        set {
            let clamped = min(max(newValue, 0), maxSeconds)
            angle = Double(clamped) / secondsPerDegree
            progress = CGFloat(angle / maxAngle)
        }
    }

    var displayTime: String {
        let s = Int(totalSecons) % 60
        let m = (Int(totalSecons) % 3600) / 60
        let h = Int(totalSecons) / 3600
        return String(format: "%d:%02d:%02d", h, m, s)  // 00:00 ~ 01:00
    }

    func onDrag(value: DragGesture.Value) {
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        let radians = atan2(vector.dy, vector.dx)  // 벡터가 x축과 이루는 각도를 구함
        var newAngle = radians * 180 / .pi
        if newAngle < 0 { newAngle = 360 + newAngle }

        let base = angle.truncatingRemainder(dividingBy: 360)
        var d = newAngle - base
        if d > 180 { d -= 360 }
        if d < -180 { d += 360 }

        if angle >= 720 && d > 0 {
            d = 0
        }

        var next = angle + d
        if next > 720 { next = 720 }
        if next < 0 { next = 0 }

        let snapped = snappedAngle(from: next)

        withAnimation(Animation.linear(duration: 0.15)) {
            let progress = snapped / 720
            self.progress = CGFloat(progress)
            self.angle = snapped
        }
    }

    @MainActor
    func countThree() async {
        self.isDone = false
        isDone = false
        for remaining in stride(from: 3, through: 1, by: -1) {
            countdown = remaining
            try? await Task.sleep(for: .seconds(1))
        }
    }

    func snappedAngle(from rawAngle: Double) -> Double {
        let totalSeconds = rawAngle * 10.0
        let snappedSeconds = (totalSeconds / 10.0).rounded() * 10.0
        return snappedSeconds / 10.0  // 다시 도 단위
    }

    func startTimer() {
        self.isActive = true
        print("start")

        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
                [weak self] _ in
                guard let strongSelf = self else {
                    return
                }

                if strongSelf.totalSecons > 0 {
                    strongSelf.totalSecons -= 1
                } else {
                    strongSelf.stopTimer()
                }
            }
        }
    }

    func stopTimer() {
        if let timer = self.timer {
            timer.invalidate()
            self.timer = nil
            self.isActive = false
            self.isDone = true
            self.angle = 0
            self.progress = 0
            print("stop")
        }
    }
}
