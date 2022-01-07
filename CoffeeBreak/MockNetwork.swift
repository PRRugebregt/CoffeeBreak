//
//  MockNetwork.swift
//  CoffeeBreak
//
//  Created by Patrick Rugebregt on 06/01/2022.
//

import Foundation
import SwiftUI

class MockNetwork {
    
    let mainBundle = Bundle.main.bundleURL
    let fetchedCoffees : Data
    init() {
        var data = Data()
        do {
            try data = Data(contentsOf: mainBundle.appendingPathComponent("FetchedCoffees.json"))
        } catch {
            print(error)
        }
        fetchedCoffees = data
        print(fetchedCoffees)
    }
    
    func fetchCoffee(completionHandler: @escaping (_ items: [CoffeeList.CoffeeItem]) -> ()) {
        let parsedJson = self.parseJson(data: fetchedCoffees)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completionHandler(parsedJson)
        }
    }
    
    func parseJson(data: Data) -> [CoffeeList.CoffeeItem] {
        let decoder = JSONDecoder()
        var result = [CoffeeList.CoffeeItem]()
        do {
            result = try decoder.decode([CoffeeList.CoffeeItem].self, from: data)
        } catch {
            print(error)
        }
        return result
    }
    
}

