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
    var warning = WarningMessage.one.rawValue
    var count = 1 {
        didSet {
            switch count {
            case 2:
                warning = WarningMessage.two.rawValue
            case 3:
                warning = WarningMessage.three.rawValue
            case 4...Int.max:
                warning = WarningMessage.four.rawValue
            default:
                warning = WarningMessage.one.rawValue
            }
        }
    }
}
