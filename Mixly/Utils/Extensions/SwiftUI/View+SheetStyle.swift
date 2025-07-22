//
//  SheetStyle.swift
//  Mixly
//
//  Created by Ross on 22.07.2025.
//

import SwiftUI

extension View {
    func bottomSheetView<Content: View> (isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View {
        self.modifier(SheetAddIngredientView(isPresented: isPresented, sheetContent: content))
    }
}
