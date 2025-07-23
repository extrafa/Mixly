//
//  AddIngredientToolBar.swift
//  Mixly
//
//  Created by Ross on 08.07.2025.
//

import SwiftUI

struct AddIngredientToolBar: ViewModifier {
    let ingredientAction: () -> Void
    let returnCategoriesAction: () -> Void
    @Binding var isCaterogyShow: Bool
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    addIngredientButton()
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    returnCategoriesButton()
                }
            }
    }
    
    func addIngredientButton() -> some View {
        Button(action: ingredientAction) {
            Image(systemName: "plus")
        }
    }
    
    func returnCategoriesButton() -> some View {
        Group {
            if isCaterogyShow == false {
                Button(action: returnCategoriesAction) {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
    
}

extension View {
    func addIngredientToolbar(ingredientAction: @escaping () -> Void, categoriesAction: @escaping () -> Void, isCategoryShow: Binding<Bool>) -> some View {
        self.modifier(AddIngredientToolBar(ingredientAction: ingredientAction, returnCategoriesAction: categoriesAction, isCaterogyShow: isCategoryShow))
    }
}
