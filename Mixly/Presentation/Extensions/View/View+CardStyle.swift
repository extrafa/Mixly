//
//  View+CardStyle.swift
//  Mixly
//
//  Created by Ross on 27.07.2025.
//

import SwiftUI

extension View {
    
    func cardStyle() -> some View {
        self
            .padding()
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
    
}
