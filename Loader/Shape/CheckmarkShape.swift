//
//  CheckmarkShape.swift
//  Loader
//
//  Created by Shankeerthan on 2024-11-04.
//

import SwiftUI

struct CheckmarkShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Define the checkmark path
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX + rect.width * 0.4, y: rect.minY + rect.height))
        path.addLine(to: CGPoint(x: rect.minX + rect.width, y: rect.minY + rect.height * 0.15))
        return path
    }
}

#Preview {
    CheckmarkShape()
}
