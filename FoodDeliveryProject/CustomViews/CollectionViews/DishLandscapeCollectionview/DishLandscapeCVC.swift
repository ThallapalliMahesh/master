//
//  DishLandscapeCVC.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 25/01/24.
//

import UIKit

class DishLandscapeCVC: UICollectionViewCell {
    
    static let identifier = String(describing: DishLandscapeCVC.self)

    @IBOutlet weak var dishImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(dish: Dish) {
        dishImgView.kf.setImage(with: dish.image?.asUrl)
        dishImgView.layer.cornerRadius = 10
        titleLbl.text = dish.name
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }

}
