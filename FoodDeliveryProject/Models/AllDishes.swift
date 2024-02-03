//
//  AllDishes.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 25/01/24.
//

import Foundation

struct AllDishes : Decodable {
    let categories : [DishCategory]?
    let populars : [Dish]?
    let specials : [Dish]?
}
