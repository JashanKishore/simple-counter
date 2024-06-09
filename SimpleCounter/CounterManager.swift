//
//  CounterManager.swift
//  SimpleCounter
//
//  Created by Jashan kishore on 9/6/2024.

/*
 This class is responsible for managing the counter value and saving it to UserDefaults whenever it changes.
 The @Published property wrapper is used so that any view observing this class will be automatically updated when the counter value changes.
 The initializer (init) sets the counter value by reading from UserDefaults.
*/

import Foundation

// This class manages the counter value and handles data persistence using UserDefaults
class CounterManager: ObservableObject {
    // The @Published property wrapper automatically notifies any views that are observing this class
    @Published var counter: Int {
        didSet {
            // Save the updated counter value to UserDefaults whenever it changes
            UserDefaults.standard.set(counter, forKey: "counter")
        }
    }
    
    // Initialize the counter value from UserDefaults
    init() {
        self.counter = UserDefaults.standard.integer(forKey: "counter")
    }
}

