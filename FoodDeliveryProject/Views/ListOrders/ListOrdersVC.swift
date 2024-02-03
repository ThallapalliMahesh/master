//
//  ListOrdersVC.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 29/01/24.
//

import UIKit

class ListOrdersVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var orders : [Order] = [
        .init(id: "id", name: "Manoj", dish: .init(id: "id1", name: "Garri", description: "This is the best i have ever Tasted", image: "https://picsum.photos/100/200", calories: 332)),
        .init(id: "id", name: "Suresh", dish: .init(id: "id1", name: "Beans and Garri", description: "This is the best i have ever Tasted", image: "https://picsum.photos/100/200", calories: 332)),
        .init(id: "id", name: "Prasad", dish: .init(id: "id1", name: "Rice and Stew", description: "This is the best i have ever Tasted", image: "https://picsum.photos/100/200", calories: 332)),
        .init(id: "id", name: "Ganesh", dish: .init(id: "id1", name: "Fride Yam", description: "This is the best i have ever Tasted", image: "https://picsum.photos/100/200", calories: 332))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Orders"
        registerCells()
    }
    
    func registerCells() {
        tableview.register(UINib.init(nibName: DishListTVC.identifier, bundle: nil), forCellReuseIdentifier: DishListTVC.identifier)
    }
}

extension ListOrdersVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: DishListTVC.identifier) as! DishListTVC
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsVC.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}
