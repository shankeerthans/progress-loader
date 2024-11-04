//
//  ContentView.swift
//  Loader
//
//  Created by Shankeerthan on 2024-10-18.
//

import SwiftUI
import Combine

struct ContentView: View {
    private let progressViewTypes: [ProgressType] = [.circle_checkmark]
    
    var body: some View {
        ScrollView {
            NavigationView {
                ForEach(0..<progressViewTypes.count, id: \.self) { i in
                    NavigationLink("\(i+1). \(progressViewTypes[i].title)") {
                        CircularProgressWithCheckmarkView()
                    }
                    .padding(.all, 10)
                    .background(.bar)
                    .clipShape(.rect(cornerRadius: 8))
                    .padding(.all, 4)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

