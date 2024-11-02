//
//  SShapeView.swift
//  Loader
//
//  Created by 4Axis on 2024-10-21.
//

import SwiftUI

struct SLoaderView: View {
    @State private var progress: CGFloat = 0.0

    var body: some View {
        ZStack {
            SShape()
                .trim(from: 0, to: progress)
                .stroke(Color.blue, lineWidth: 5)
                .frame(width: 100, height: 200)
                .onAppear {
                    // Animate the drawing of "S" in a loop
                    withAnimation(
                        Animation.linear(duration: 2.0)
                            .repeatForever(autoreverses: false)
                    ) {
                        progress = 1.0
                    }
                }
        }
    }
}

struct SShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.width
        let height = rect.height

        path.move(to: CGPoint(x: width * 0.1, y: height * 0.1))
        path.addCurve(to: CGPoint(x: width * 0.9, y: height * 0.45),
                      control1: CGPoint(x: width * 0.7, y: height * 0.1),
                      control2: CGPoint(x: width * 0.9, y: height * 0.25))

        path.addCurve(to: CGPoint(x: width * 0.1, y: height * 0.9),
                      control1: CGPoint(x: width * 0.9, y: height * 0.7),
                      control2: CGPoint(x: width * 0.3, y: height * 0.9))

        return path
    }
}

#Preview {
    SLoaderView()
}
