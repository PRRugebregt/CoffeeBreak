//
//  CoffeeBreakApp.swift
//  CoffeeBreak
//
//  Created by Patrick Rugebregt on 06/01/2022.
//

import SwiftUI

@main
struct CoffeeBreakApp: App {
    let coffeeMachine = CoffeeMachine()
    var body: some Scene {
        WindowGroup {
            ContentView(coffeeMachine: coffeeMachine)
        }
    }
}
