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
    
    var title: String {
        switch self {
        case .circle_checkmark:
            "Circle progress view with checkmark"
        case .ellipsis:
            "Ellipsis progress view"
        }
    }
}
