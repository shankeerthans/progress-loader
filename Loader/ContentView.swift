//
//  ContentView.swift
//  Loader
//
//  Created by Shankeerthan on 2024-10-18.
//

import SwiftUI
import Combine

struct ContentView: View {
    private let progressViewTypes: [ProgressType] = [.circle_checkmark, .ellipsis, .circle_loop, .linear_loop]
    
    var body: some View {
        NavigationStack {
            List(0..<progressViewTypes.count, id: \.self) { i in
                NavigationLink("\(i+1). \(progressViewTypes[i].title)", value: progressViewTypes[i])
            }
            .navigationDestination(for: ProgressType.self) { type in
                switch type {
                case .circle_checkmark:
                    CircularProgressWithCheckmarkView()
                case .ellipsis:
                    EllipsisProgressView()
                case .circle_loop:
                    CircularLoopProgressView()
                case .linear_loop:
                    LinearLoopProgressView()
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}

