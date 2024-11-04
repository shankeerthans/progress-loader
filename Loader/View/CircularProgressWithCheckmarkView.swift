//
//  CircularProgressWithCheckmarkView.swift
//  Loader
//
//  Created by Shankeerthan on 2024-11-04.
//

import SwiftUI
import Combine

struct CircularProgressWithCheckmarkView: View {
    @State private var timer = Timer.publish(every: 0.01, on: .main, in: .common)
    @State private var progress: CGFloat = 0
    @State private var drawCheckmark = false
    @State private var cancellable: AnyCancellable?
    private let circleLineWidth: CGFloat = 16
    private let checkmarkLineWidth: CGFloat = 10
    private let width: CGFloat = 100
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(style: .init(lineWidth: 16))
                .foregroundStyle(.green.opacity(0.2))
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: .init(lineWidth: circleLineWidth, lineCap: .round))
                .foregroundStyle(.green)
                .rotationEffect(.degrees(-90))
            
            CheckmarkShape()
                .trim(from: 0, to: drawCheckmark ? 1 : 0)
                .stroke(style: .init(lineWidth: checkmarkLineWidth, lineCap: .round, lineJoin: .round))
                .foregroundStyle(.green)
                .scaledToFit()
                .frame(width: (width - 2*circleLineWidth)*0.55)
        }
        .frame(width: width, height: width)
        .onAppear {
            startTimer()
        }
        .onTapGesture {
            startTimer()
        }
    }
    
    func startTimer() {
        progress = 0.0
        drawCheckmark = false
        cancellable = Timer.publish(every: 0.01, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                if progress < 1.0 {
                    progress += 0.01
                } else {
                    withAnimation(.easeInOut(duration: 1)) {
                        drawCheckmark = true
                    }
                    stopTimer()
                }
            }
    }
            
    func stopTimer() {
        cancellable?.cancel()
        cancellable = nil
    }
}

#Preview {
    CircularProgressWithCheckmarkView()
}
