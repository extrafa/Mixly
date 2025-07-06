//
//  CocktailCardView.swift
//  Mixly
//
//  Created by Ross on 23.06.2025.
//

import SwiftUI

struct CocktailCardView: View {
    let imageURL: String
    let name: String
    let alcoholic: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            itemImageFor(url: imageURL)
            
            VStack(alignment: .leading, spacing: 4) {
                itemTextFor(name: name, alcoholic: alcoholic ? "Alcoholic" : "Non-alcoholic")
            }
            
            Spacer(minLength: 8)
            
            
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

private extension CocktailCardView {
    
    func itemImageFor(url: String) -> some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                Image("notFound")
                    .imageStyle()
            case .success(let image):
                image
                    .imageStyle()
            case .failure(let error):
                Image("notFound")
                    .imageStyle()
            @unknown default:
                EmptyView()
            }
        }
    }
    
    func itemTextFor(name: String, alcoholic: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name)
                .textStyle(font: .headline, lineLimit: 1)
                .minimumScaleFactor(0.8)
            
            Text(alcoholic)
                .textStyle(font: .subheadline, lineLimit: 2)
                .foregroundStyle(.secondary)
        }
    }
    
}

extension Image {
    
    func imageStyle(imageSize: CGFloat = UIScreen.main.bounds.width < 400 ? 50 : 64) -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: imageSize, height: imageSize)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
    
}

extension Text {
    
    func textStyle(font: Font, lineLimit: Int) -> some View {
        self
            .font(font)
            .lineLimit(lineLimit)
    }
    
}


#Preview {
    CocktailCardView(
        imageURL: "https://boozeapi.com/api/img/cocktails/150.jpg",
        name: "Old Fashioned",
        alcoholic: true
    )
    .padding()
}
