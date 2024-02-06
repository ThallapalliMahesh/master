//
//  UIViewController+Extension.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 26/01/24.
//

import UIKit

extension UIViewController {
    static var identifier : String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: identifier)
    }
}
