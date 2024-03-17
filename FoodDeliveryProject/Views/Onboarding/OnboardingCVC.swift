//
//  OnboardingCVC.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 24/01/24.
//

import UIKit

class OnboardingCVC: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCVC.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    func setup(_ slide : OnboardingSlides) {
        slideImageView.image = slide.image
        slideImageView.layer.cornerRadius = 10
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
    }
}
