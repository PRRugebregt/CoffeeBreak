//
//  FinishedCoffee.swift
//  CoffeeBreak
//
//  Created by Patrick Rugebregt on 07/01/2022.
//

import SwiftUI

struct FinishedCoffee: View {
    let howManyCoffees = HowManyCoffees.shared
    var name: String
    var body: some View {
        VStack{
            Text("Voila. Enjoy!")
            Image(name,
                 bundle: nil,
                 label: Text("There you go. Enjoy!"))
                .resizable()
                .aspectRatio(contentMode: .fit)
            NavigationLink {
                CoffeeMeter()
            } label: {
                Text("Drink this coffee?")
            }
        }
    }
}

struct CoffeeMeter: View {
    var howManyCoffees = HowManyCoffees.shared
    
    var warning : WarningMessage {
        switch howManyCoffees.count {
        case 1:
            return WarningMessage.one
        case 2:
            return WarningMessage.two
        case 3:
            return WarningMessage.three
        case 4:
            return WarningMessage.four
        default:
            return WarningMessage.one
        }
    }
    var body: some View {
        Text(warning.rawValue)
            .onAppear {
                howManyCoffees.count += 1
                print(howManyCoffees.count)
            }

    }
}

struct FinishedCoffee_Previews: PreviewProvider {
    static var previews: some View {
        FinishedCoffee(name: "")
    }
}
