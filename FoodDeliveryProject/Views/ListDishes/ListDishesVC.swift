//
//  ListDishesVC.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 29/01/24.
//

import UIKit

class ListDishesVC: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var category : DishCategory!
    
    var dishes : [Dish] = [
        .init(id: "id1", name: "Garri", description: "This is the best i have ever Tasted", image: "https://picsum.photos/100/200", calories: 332),
        .init(id: "id2", name: "Indomie", description: "This is the best i have ever Tasted This is the best i have ever Tasted This is the best i have ever Tasted This is the best i have ever Tasted This is the best i have ever Tasted This is the best i have ever Tasted", image: "https://picsum.photos/100/200", calories: 132),
        .init(id: "id2", name: "Pizzza", description: "This is the best i have ever Tasted", image: "https://picsum.photos/100/200", calories: 32)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category.name
        registerCells()
    }
    
    func registerCells() {
        tableview.register(UINib.init(nibName: DishListTVC.identifier, bundle: nil), forCellReuseIdentifier: DishListTVC.identifier)
    }
}

extension ListDishesVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: DishListTVC.identifier) as! DishListTVC
        cell.setUp(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let controller = DishDetailsVC.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
