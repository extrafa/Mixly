//
//  Color+Category.swift
//  Mixly
//
//  Created by Ross on 11.07.2025.
//

import SwiftUI

extension Category {
    var colors: [Color] {
        switch self.label?.lowercased() {
        case "shot":
            return [.green, .mint]
        case "other / unknown":
            return [.gray, .indigo]
        case "ordinary drink":
            return [.blue, .purple]
        case "beer":
            return [.orange, .red]
        case "soft drink":
            return [.orange, .pink]
        case "cocoa":
            return [.brown, .purple]
        case "shake":
            return [.pink, .teal]
        case "cocktail":
            return [.cyan, .purple]
        case "homemade liqueur":
            return [.teal, .orange]
        case "coffee / tea":
            return [.brown, .yellow]
        case "punch / party drink":
            return [.red, .yellow]
        default:
            return [.gray, .blue]
        }
    }
}
