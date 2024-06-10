//
//  CustomBackButtonModifier.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 10/6/2024.
//

import SwiftUI

struct CustomBackButtonModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.blue)
                    .imageScale(.large)
            })
    }
}

extension View {
    func customBackButton() -> some View {
        self.modifier(CustomBackButtonModifier())
    }
}
