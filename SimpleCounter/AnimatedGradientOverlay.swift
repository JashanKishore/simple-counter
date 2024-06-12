//
//  AnimatedGradientOverlay.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 12/6/2024.
//

import SwiftUI

struct AnimatedGradientOverlay: View {
    let colors: [Color]
    @State private var startPoint = UnitPoint(x: -1, y: 0)
    @State private var endPoint = UnitPoint(x: 0, y: 1)
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint)
            .onAppear {
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: true)) {
                    startPoint = UnitPoint(x: 1, y: 0)
                    endPoint = UnitPoint(x: 2, y: 1)
                }
            }
    }
}

