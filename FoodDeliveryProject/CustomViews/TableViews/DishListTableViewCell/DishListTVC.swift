//
//  DishListTVC.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 29/01/24.
//

import UIKit

class DishListTVC: UITableViewCell {
    
    static let identifier = "DishListTVC"

    @IBOutlet weak var dishImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setUp(dish : Dish) {
        dishImgView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
    }
    
    func setup(order: Order) {
        dishImgView.kf.setImage(with: order.dish?.image?.asUrl)
        titleLbl.text = order.dish?.name
        descriptionLbl.text = order.name
    }
}
