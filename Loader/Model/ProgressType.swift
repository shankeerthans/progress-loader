//
//  ProgressType.swift
//  Loader
//
//  Created by Shankeerthan on 2024-11-04.
//

import Foundation

enum ProgressType {
    case circle_checkmark
    case ellipsis
    case circle_loop
    case linear_loop
    
    var title: String {
        switch self {
        case .circle_checkmark:
            "Circular progress view with checkmark"
        case .ellipsis:
            "Ellipsis progress view"
        case .circle_loop:
            "Circular loop progress view"
        case .linear_loop:
            "Linear loop progress view"
        }
    }
}
