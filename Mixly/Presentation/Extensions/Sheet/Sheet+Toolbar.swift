//
//  Sheet+Toolbar.swift
//  Mixly
//
//  Created by Ross on 29.07.2025.
//

import SwiftUI

struct SheetToolbar: ViewModifier {
    let leadingAction: () -> Void
    let trailingAction: () -> Void
    let leadingSystemName: String?
    let trailingSystemName: String?
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    leadingButton(systemName: leadingSystemName ?? "")
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingButton(systemName: trailingSystemName ?? "")
                }
            }
    }
    
    func leadingButton(systemName: String) -> some View {
        Button(action: leadingAction) {
            Image(systemName: systemName)
        }
    }
    
    func trailingButton(systemName: String) -> some View {
        Button(action: trailingAction) {
            Image(systemName: systemName)
        }
    }
    
}

extension View {
    func sheetToolbar(
        leadingAction: @escaping () -> Void,
        trailingAction: @escaping () -> Void,
        leadingSystemName: String?,
        trailingSystemName: String?
    ) -> some View {
        self.modifier(SheetToolbar(
            leadingAction: leadingAction,
            trailingAction: trailingAction,
            leadingSystemName: leadingSystemName,
            trailingSystemName: trailingSystemName
        ))
    }
}
