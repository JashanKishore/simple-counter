//
//  SimpleCounterApp.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 4/6/2024.
//

import SwiftUI

@main
struct SimpleCounterApp: App {
    @StateObject private var counterManager = CounterManager()
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(counterManager)
                .preferredColorScheme(isDarkMode ? .dark : .light) // Update the color scheme
        }
    }
}
