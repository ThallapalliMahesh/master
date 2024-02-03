//
//  DishCategory.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 25/01/24.
//

import Foundation

struct DishCategory : Decodable {
    let id, name, image : String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title" 
        case image
    }
}
