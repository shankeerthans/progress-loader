//
//  EllipsisProgressView.swift
//  Loader
//
//  Created by Shankeerthan on 2024-11-04.
//

import SwiftUI
import Combine

struct EllipsisProgressView: View {
    @State private var loadingIndex: Int = 0
    @State private var cancellable: AnyCancellable?
    private let count: Int = 4
    
    var body: some View {
        HStack {
            ForEach(0..<count, id: \.self) { index in
                Circle()
                    .scaleEffect((index == loadingIndex) ? 1.1 : 0.5)
                    .foregroundStyle((index == loadingIndex) ? .teal : .green)
                    .animation(.easeInOut(duration: 0.7), value: loadingIndex)
            }
        }
        .frame(height: 30)
        .onAppear {
            startTimer()
        }
    }
    
    func startTimer() {
        cancellable = Timer.publish(every: 1.0/Double(count), on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                loadingIndex = (loadingIndex + 1) % count
            }
    }
            
    func stopTimer() {
        cancellable?.cancel()
        cancellable = nil
    }
}

#Preview {
    EllipsisProgressView()
}
