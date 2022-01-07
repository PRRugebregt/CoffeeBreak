//
//  CoffeeItem.swift
//  CoffeeBreak
//
//  Created by Patrick Rugebregt on 06/01/2022.
//

import Foundation


struct CoffeeList {
    
    var items : [CoffeeItem]
    
    init(items: [CoffeeItem]) {
        self.items = items
    }
    
    struct CoffeeItem: Codable, Identifiable {
        let id: Int
        let title: String
        let description: String
        let ingredients: [String]
    }
}

