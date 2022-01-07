//
//  Network.swift
//  CoffeeBreak
//
//  Created by Patrick Rugebregt on 06/01/2022.
//

import Foundation
import SwiftUI

class Network {
    
    let urlString = "https://api.sampleapis.com/coffee/hot"
    
    func fetchCoffee(completionHandler: @escaping (_ items: [CoffeeList.CoffeeItem]) -> ()) {
        let url = URL(string: urlString)
        let session = URLSession.shared
        session.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let data = data {
                let parsedJson = self.parseJson(data: data)
                completionHandler(parsedJson)
            }
        }.resume()
            
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
