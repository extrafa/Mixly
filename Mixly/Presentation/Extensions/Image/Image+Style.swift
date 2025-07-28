//
//  Image+Style.swift
//  Mixly
//
//  Created by Ross on 27.07.2025.
//

import SwiftUI

extension Image {
    
    func imageStyle(imageSize: CGFloat) -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: imageSize, height: imageSize)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
    
}
