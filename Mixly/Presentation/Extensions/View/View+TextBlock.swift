//
//  View+TextBlock.swift
//  Mixly
//
//  Created by Ross on 27.07.2025.
//

import SwiftUI

extension View {
    
    func textFor(name: String, alcoholic: String?, instruction: String?) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name)
                .textStyle(font: .headline, lineLimit: 1)
                .minimumScaleFactor(0.8)
            
            if let alcoholic {
                Text(alcoholic)
                    .textStyle(font: .subheadline, lineLimit: 1)
            }
            
            if let instruction {
                Text(instruction)
                    .font(.body)
                    .minimumScaleFactor(0.8)
                    .padding(.vertical)
            }
        }
    }
    
}
