//
//  String+Extension.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 25/01/24.
//

import Foundation

extension String {
    var asUrl : URL?{
        return URL(string: self)
    }
}
