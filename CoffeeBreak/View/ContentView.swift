//
//  ContentView.swift
//  CoffeeBreak
//
//  Created by Patrick Rugebregt on 06/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var coffeeMachine : CoffeeMachine
    
    var body: some View {
        VStack {
            HStack {
                Text("Junior dev coffee fetching app")
                Image(systemName: "flame")
            }
            NavigationView {
                List(coffeeMachine.items ?? []) { item in
                    if item.id <= 14 {
                        HStack {
                            VStack {
                                Text(item.title)
                                    .font(.largeTitle)
                                Text(item.description)
                                    .font(.body)
                            }
                            NavigationLink {
                                DetailView(item: item)
                            } label: {
                                
                            }
                            .frame(width: 30)
                        }
                    }
                }
            }
        }
    }
}

struct DetailView: View {
    var item: CoffeeList.CoffeeItem
    init(item: CoffeeList.CoffeeItem) {
        self.item = item
    }
    
    var body: some View {
        VStack {
            Text("Ingredients")
                .padding()
                .font(.largeTitle)
            List(item.ingredients, id: \.self) { ingredient in
                Text(ingredient)
            }
            NavigationLink {
                FinishedCoffee(name: item.title)
            } label: {
                Text("Make this coffee")
            }
            .frame(height: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let coffeeMachine = CoffeeMachine()
        ContentView(coffeeMachine: coffeeMachine)
    }
}
