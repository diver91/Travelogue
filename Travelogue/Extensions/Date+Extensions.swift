//
//  Date+Extensions.swift
//  Date+Extensions
//
//  Created by Patrick Goudeau on 8/22/21.
//

import Foundation
extension Date {
    
    func asFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: self)
    }
    
}

extension Date {
    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter.string(from: self).replacingOccurrences(of: " ", with: "\n")
    }
}
