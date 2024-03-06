//
//  DishDetailsVC.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 26/01/24.
//

import UIKit
import ProgressHUD

class DishDetailsVC: UIViewController {
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    
    var dishes : Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateView()
        
    }
    
    func populateView() {
        dishImageView.kf.setImage(with: dishes.image?.asUrl)
        titleLbl.text = dishes.name
        descriptionLbl.text = dishes.description
        caloriesLbl.text = dishes.formattedCalories
    }
    
    @IBAction func placeOrderButtonTapped(_ sender: Any) {
        guard let name = nameTF.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("Please enter your name")
            return
        }
        ProgressHUD.show("Place Order...")
        
        NetworkService.shared.placeOrder(dishId: dishes.id ?? "", name: name) { (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been Received 👩‍🍳")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
}
