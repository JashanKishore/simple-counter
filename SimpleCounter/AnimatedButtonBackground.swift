//
//  AnimatedButtonBackground.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 12/6/2024.
//

import SwiftUI

struct AnimatedButtonBackground: View {
    let baseColor: Color
    let animationColors: [Color]
    
    var body: some View {
        ZStack {
            baseColor
            AnimatedGradientOverlay(colors: animationColors)
                .blendMode(.overlay)
                
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

