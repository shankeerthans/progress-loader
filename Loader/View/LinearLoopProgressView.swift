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
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: height/2)
                .foregroundStyle(.blue.opacity(0.2))
                .frame(width: width, height: height)
            
            RoundedRectangle(cornerRadius: height/2)
                .foregroundStyle(.blue.opacity(0.87))
                .frame(width: width/4 + abs(offsetX), height: height)
                .offset(x: offsetX)
                .animation(.easeInOut(duration: 0.1), value: offsetX)
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
        cancellable = Timer.publish(every: 0.006, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                offsetX += 1 * scalar
                if offsetX >= width/4 {
                    scalar = -1
                } else if offsetX <= -width/4 {
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
    LinearLoopProgressView()
}
