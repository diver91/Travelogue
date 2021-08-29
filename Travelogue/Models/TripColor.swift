//
//  TripColor.swift
//  TripColor
//
//  Created by Patrick Goudeau on 8/21/21.
//

import Foundation
import SwiftUI

enum TripColor: String, CaseIterable {
    case blue
    case green
    
    case orange
    
    case pink
    
    case purple
    case red
    case yellow
    
    public var color: Color {
        switch self {
        case .green:
            return Color.green
        case .blue:
            return Color.blue
        case .pink:
            return Color.pink
        case .red:
            return Color.red
        case .yellow:
            return Color.yellow
        case .purple:
            return Color.purple
        case .orange:
            return Color.orange
        }
    }
    
    static func rawValueList() -> [String]  {
        var list = [String]()
        for colorCase in allCases {
            let value = colorCase.rawValue
            list.append(value)
        }
        
       // print(list)
        return list
    }
}
