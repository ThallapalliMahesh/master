//
//  CategoryCVC.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 25/01/24.
//

import UIKit
import Kingfisher

class CategoryCVC: UICollectionViewCell {

    @IBOutlet weak var categoryImgView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    static let identifier = String(describing: CategoryCVC.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setUp(category: DishCategory) {
        categoryTitleLbl.text = category.name
        categoryImgView.kf.setImage(with: category.image?.asUrl)
    }
}
