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
        optionals()
        typealiasing()
        sumOfValue(value: 321,21,41,654,852,74)
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
    
    func optionals() {
        var a : Int?
        let b = 10
        
        a = 20
        
        if let value = a {
            print("Value of a is : \(value)")
        } else {
            print("No value in a")
        }
        
        guard let aValue = a else {
            print("aValue is Empty")
            return
        }
        print("aValue : \(aValue)")
        
        let add = a! + b
        print("Addition : \(add)")
        
        let totalValue = aValue ?? 0 + b
        print("Total value : \(totalValue)")
    }
    
    func typealiasing() {
        typealias travelling = Int
        let distance : travelling = 65
        print("Distance : \(distance)")
        
        typealias person = (name : String,age: Int)
        let aPerson : person = ("Charan",24)
        print("aPerson : \(aPerson)")
        
        typealias Number = (Int,Int) -> Int
        func add(a : Int, b : Int) -> Int {
            return a + b
        }
        let num : Number = add
        print("Number : \(num(254,721))")
        
        typealias Closure = (Int, Int) -> Int
        let aClosure : Closure = { (a : Int, b : Int) -> Int in
            return a + b
        }
        let closure = aClosure(23,54)
        print("Closure : \(closure)")
        
    }
    
    func sumOfValue(value : Int...) {
        var num = 0
        for number in value {
            num = number + num
        }
        print("Sum of Value : \(num)")
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
