//
//  Text+Style.swift
//  Mixly
//
//  Created by Ross on 27.07.2025.
//

import SwiftUI

extension Text {
    
    func textStyle(font: Font, lineLimit: Int) -> some View {
        self
            .font(font)
            .lineLimit(lineLimit)
    }
    
}
