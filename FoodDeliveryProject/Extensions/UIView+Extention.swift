//
//  UIView+Extention.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 24/01/24.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
