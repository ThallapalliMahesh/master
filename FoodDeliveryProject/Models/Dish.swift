//
//  Dish.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 25/01/24.
//

import Foundation

struct Dish : Decodable {
    let id, name, description, image : String?
    let calories : Int?
    
    var formattedCalories : String {
        return "\(calories ?? 0) calories"
    }
}
