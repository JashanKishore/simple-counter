//
//  ConditionalShadow.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 11/6/2024.
//

import SwiftUI

struct ConditionalShadow: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        if colorScheme == .light {
            content.shadow(color: .gray, radius: 5, x: 0, y: 5)
        } else {
            content
        }
    }
}

extension View {
    func conditionalShadow(colorScheme: ColorScheme) -> some View {
        self.modifier(ConditionalShadow())
    }
}
