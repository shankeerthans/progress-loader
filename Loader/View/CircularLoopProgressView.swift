//
//  CircularLoopProgressView.swift
//  Loader
//
//  Created by Shankeerthan on 2024-11-04.
//

import SwiftUI
import Combine

struct CircularLoopProgressView: View {
    @State var angle: CGFloat = 0.0
    @State private var cancellable: AnyCancellable?
    private let circleLineWidth: CGFloat = 16
    private let width: CGFloat = 100
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(style: .init(lineWidth: 16))
                .foregroundStyle(.blue.opacity(0.2))
            
            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(style: .init(lineWidth: circleLineWidth, lineCap: .round))
                .foregroundStyle(.blue.opacity(0.87))
                .rotationEffect(.radians(angle))
                .animation(.smooth(duration: 1), value: angle)
        }
        .frame(width: width, height: width)
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }
    
    func startTimer() {
        angle = 0.0
        cancellable = Timer.publish(every: 0.01, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                angle += 0.05
            }
    }
            
    func stopTimer() {
        cancellable?.cancel()
        cancellable = nil
    }
}

#Preview {
    CircularLoopProgressView()
}
