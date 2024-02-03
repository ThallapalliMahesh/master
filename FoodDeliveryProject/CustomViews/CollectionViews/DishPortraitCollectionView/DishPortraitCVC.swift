//
//  DishPortraitCVC.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 25/01/24.
//

import UIKit

class DishPortraitCVC: UICollectionViewCell {

    static let identifier = "DishPortraitCVC"
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImgView: UIImageView!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setUp(dish: Dish) {
        titleLbl.text = dish.name
        dishImgView.kf.setImage(with: dish.image?.asUrl)
        dishImgView.layer.cornerRadius = 5
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }

}
