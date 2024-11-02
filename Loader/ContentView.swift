//
//  ContentView.swift
//  Loader
//
//  Created by 4Axis on 2024-10-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SLoaderView()
    }
}

//#Preview {
//    ContentView()
//}
struct AssistCalloutView: View {
    var body: some View {
        ZStack {
            CalloutShape()
                .trim(from: 0.0, to: 0.3)
                .foregroundStyle(.red)
                .frame(width: 400, height: 300)
        }
        .frame(width: 400, height: 300)
    }
}

struct CalloutShape: Shape {
    var cornerRadius: CGFloat = 36
    
    nonisolated func path(in rect: CGRect) -> Path {
        let bubbleWidth: CGFloat = rect.width/6
        let bubbleheight: CGFloat = rect.height/3
        
        var path = Path()
        let roundedRect: CGRect = .init(origin: rect.origin, size: .init(width: rect.width, height: rect.height - bubbleheight))
        
        let bubbleStart = CGPointMake(roundedRect.minX + bubbleWidth/2, roundedRect.maxY)
        let bubbleTip = CGPointMake(roundedRect.minX, roundedRect.maxY + bubbleheight)
        let bubbleEnd = CGPointMake(bubbleStart.x + bubbleWidth, roundedRect.maxY)
        
        path.move(to: bubbleStart)
        path.addLine(to: bubbleTip)
        path.addLine(to: bubbleEnd)
        
        path.addRoundedRect(in: roundedRect, cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
        return path
    }
}

#Preview {
    AssistCalloutView()
}

