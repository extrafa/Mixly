//
//  View+ImageCard.swift
//  Mixly
//
//  Created by Ross on 27.07.2025.
//

import SwiftUI

extension View {
    
    func imageFrom(url: String) -> some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                Image("notFound")
                    .imageStyle()
            case .success(let image):
                image
                    .imageStyle()
            case .failure:
                Image("notFound")
                    .imageStyle()
            @unknown default:
                EmptyView()
            }
        }
    }
    
    func cardStyle() -> some View {
        self
            .padding()
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
    
}
