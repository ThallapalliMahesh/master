//
//  APIResponse.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 25/01/24.
//

import Foundation

struct APIResponse<T : Decodable> : Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}

