//
//  LinearLoopProgressView.swift
//  Loader
//
//  Created by Shankeerthan on 2024-11-04.
//

import SwiftUI
import Combine

struct LinearLoopProgressView: View {
    @State var offsetX: CGFloat = 0.0
    @State var scalar: CGFloat = 1
    @State private var cancellable: AnyCancellable?
    private let circleLineWidth: CGFloat = 16
    private let width: CGFloat = 300
    private let height: CGFloat = 10
    let type: ProgressType
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: height/2)
                .foregroundStyle(.blue.opacity(0.2))
                .frame(width: width, height: height)
            
            if type == .linear_loop {
                RoundedRectangle(cornerRadius: height/2)
                    .foregroundStyle(.blue.opacity(0.87))
                .frame(width: width/4 + abs(offsetX), height: height)
                .offset(x: offsetX)
                .animation(.easeInOut(duration: 0.1), value: offsetX)
            } else {
                RoundedRectangle(cornerRadius: height/2)
                    .foregroundStyle(.blue.opacity(0.87))
                .frame(width: width/2, height: height)
                .offset(x: offsetX)
                .animation(.easeInOut(duration: 0.1), value: offsetX)
                .mask {
                    RoundedRectangle(cornerRadius: height/2)
                        .frame(width: width, height: height)
                }
            }
                
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
        offsetX = 0.0
        cancellable = Timer.publish(every: (type == .linear_loop) ? 0.006 : 0.002, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                offsetX += 1 * scalar
                let threshold = (type == .linear_loop) ? width/4 : width/2
                if offsetX >= threshold {
                    scalar = -1
                } else if offsetX <= -threshold {
                    scalar = 1
                }
            }
    }
            
    func stopTimer() {
        cancellable?.cancel()
        cancellable = nil
    }
}

#Preview {
    LinearLoopProgressView(type: .linear_loop_unchanged_width)
}
