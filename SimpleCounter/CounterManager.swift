//
//  CounterManager.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 9/6/2024.

import Foundation

// This class manages the counter value and the increment value, handling data persistence using UserDefaults
class CounterManager: ObservableObject {
    // The @Published property wrapper automatically notifies any views that are observing this class
    @Published var counter: Int {
        didSet {
            // Save the updated counter value to UserDefaults whenever it changes
            UserDefaults.standard.set(counter, forKey: "counter")
        }
    }
    
    @Published var incrementValue: Int {
        didSet {
            // Save the updated increment value to UserDefaults whenever it changes
            UserDefaults.standard.set(incrementValue, forKey: "incrementValue")
        }
    }
    
    // Initialize the counter and increment values from UserDefaults
    init() {
        self.counter = UserDefaults.standard.integer(forKey: "counter")
        self.incrementValue = UserDefaults.standard.integer(forKey: "incrementValue")
        // Set a default increment value if none is found in UserDefaults
        if incrementValue == 0 {
            incrementValue = 1
        }
    }
}

