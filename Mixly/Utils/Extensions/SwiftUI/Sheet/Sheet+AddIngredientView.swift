//
//  Sheet+AddIngredient.swift
//  Mixly
//
//  Created by Ross on 22.07.2025.
//

import SwiftUI

struct SheetAddIngredientView<SheetContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    let sheetContent: () -> SheetContent
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented) {
                sheetContent()
                    .presentationDetents([.large])
                    .presentationDragIndicator(.hidden)
            }
    }
}
