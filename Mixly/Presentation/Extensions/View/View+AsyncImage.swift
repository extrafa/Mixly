//
//  View+AsyncImage.swift
//  Mixly
//
//  Created by Ross on 27.07.2025.
//

import SwiftUI

extension View {
    
    func imageFrom(url: String, imageSize: CGFloat) -> some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                Image("notFound")
                    .imageStyle(imageSize: imageSize)
            case .success(let image):
                image
                    .imageStyle(imageSize: imageSize)
            case .failure:
                Image("notFound")
                    .imageStyle(imageSize: imageSize)
            @unknown default:
                EmptyView()
            }
        }
    }
    
}
