//
//  People.swift
//  People
//
//  Created by Patrick Goudeau on 8/21/21.
//

import Foundation
import SwiftUI


enum Persons: String, CaseIterable, Identifiable {
    case Patrick
    case Kirk
    case Debbie
    case Keith
    case Yellow
    var id: String { self.rawValue }
}


