//
//  Functions.swift
//  Functions
//
//  Created by Patrick Goudeau on 8/23/21.
//

import Foundation
import SwiftUI

func tripColor(color: String) -> Color {
    
    
    switch color {
    case "purple":
        return .purple
    case "green":
        return .green
    case "pink":
        return .pink
    case "yellow":
        return .yellow
    case "blue":
        return .blue
    case "red":
        return .red
    case "orange":
        return .orange
    default:
        return .blue
    }
    
}
