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
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier) as! Self
        return storyboard
    }
}
