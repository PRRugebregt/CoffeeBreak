//
//  HowManyCoffees.swift
//  CoffeeBreak
//
//  Created by Patrick Rugebregt on 07/01/2022.
//

import Foundation

enum WarningMessage: String {
    case one = "We all need that first one. Welcome to a new day"
    case two = "Alright right on! Now we are ready to start work"
    case three = "Ok slow down buddy. Don't get too excited now..."
    case four = "Aiiii you've crashed. Caffeine OVERLOAD"
}

class HowManyCoffees {
    static let shared = HowManyCoffees()
    var count = 1
}
