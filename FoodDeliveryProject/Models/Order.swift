//
//  Order.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 25/01/24.
//

import Foundation

struct Order : Decodable {
    let id : String?
    let name : String?
    let dish : Dish?
}
