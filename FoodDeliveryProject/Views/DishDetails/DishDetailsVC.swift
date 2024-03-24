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
        dishImageView.layer.backgroundColor = UIColor.blue.cgColor
        titleLbl.text = dishes.name
        descriptionLbl.text = dishes.description
        caloriesLbl.text = dishes.formattedCalories
        tuple()
    }
    
    func tuple() {
        let datatypes = (dict: ["Dictionary":"It stores key value pairs"], array : ["Array : It is a collection of similar or dissimilar objects or premetive datatypes by accessing through the index"], "String : It Stores collection of Characters","Int : It stores Integer values", "Float : It stores floating point values", "Double : It stores long pressision float values", "Any : It stores any kind of values", "Set : It stores objects or premitive datatypes in an unordered collections", "Tuple : It is a process of grouping multiple values together into a single variable")
        print(datatypes.dict)
        print(datatypes.array)
        print(datatypes.2)
        print(datatypes.3)
        print(datatypes.4)
        print(datatypes.5)
        print(datatypes.6)
        print(datatypes.7)
        print(datatypes.8)
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
