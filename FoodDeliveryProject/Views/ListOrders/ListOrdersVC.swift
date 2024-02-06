//
//  ListOrdersVC.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 29/01/24.
//

import UIKit
import ProgressHUD

class ListOrdersVC: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var orders : [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Orders"
        registerCells()
        
        ProgressHUD.show()
        
        NetworkService.shared.fetchOrders { [weak self] (result) in
            switch result {
            case .success(let order):
                ProgressHUD.dismiss()
                self?.orders = order
                self?.tableview.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchOrders { [weak self] (result) in
            switch result {
            case .success(let orders):
                ProgressHUD.dismiss()
                self?.orders = orders
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
