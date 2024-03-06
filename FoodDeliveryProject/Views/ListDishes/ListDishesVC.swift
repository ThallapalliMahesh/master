//
//  ListDishesVC.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 29/01/24.
//

import UIKit
import ProgressHUD

class ListDishesVC: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var category : DishCategory!
    
    var dishes : [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = category.name
        registerCells()
        
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id ?? "") { [weak self] (result) in
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.tableview.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsVC.instantiate()
        controller.dishes = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
