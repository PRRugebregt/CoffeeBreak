//
//  CoffeeMachine.swift
//  CoffeeBreak
//
//  Created by Patrick Rugebregt on 06/01/2022.
//

import Foundation
import SwiftUI

class CoffeeMachine: ObservableObject {
    
    @Published var model: CoffeeList?
    var items: [CoffeeList.CoffeeItem]?
    var network: Networkable
    
    init() {
        network = MockNetwork()
        network.fetchCoffee { items in
            DispatchQueue.main.async {
                print("loaded model")
                self.model = CoffeeList(items: items)
                self.items = items
            }
        }
    }
    
}
