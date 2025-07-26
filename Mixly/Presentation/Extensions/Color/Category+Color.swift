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
            return [.red, .orange]
        case "ordinary drink":
            return [.blue, .indigo]
        case "beer":
            return [.yellow, .orange]
        case "soft drink":
            return [.mint, .cyan]
        case "cocoa":
            return [.brown, .orange]
        case "shake":
            return [.pink, .orange]
        case "cocktail":
            return [.purple, .pink]
        case "homemade liqueur":
            return [.teal, .green]
        case "coffee / tea":
            return [.brown, .red]
        case "punch / party drink":
            return [.red, .purple]
        case "other / unknown":
            return [.gray, .black]
        default:
            return [.gray, .blue]
        }
    }
}
