//
//  HomeVC.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 24/01/24.
//

import UIKit
import ProgressHUD

class HomeVC: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    var category : [DishCategory] = []
    var popular : [Dish] = []
    var special: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {

        registerCells()
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.category = allDishes.categories ?? []
                self?.popular = allDishes.populars ?? []
                self?.special = allDishes.specials ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.specialsCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCVC.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCVC.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCVC.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCVC.identifier)
        specialsCollectionView.register(UINib(nibName: DishLandscapeCVC.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCVC.identifier)
    }
}

extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return category.count
        case popularCollectionView:
            return popular.count
        case specialsCollectionView:
            return special.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCVC.identifier, for: indexPath) as! CategoryCVC
            cell.setUp(category: category[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCVC.identifier, for: indexPath) as! DishPortraitCVC
            cell.setUp(dish: popular[indexPath.row])
            return cell
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCVC.identifier, for: indexPath) as! DishLandscapeCVC
            cell.setUp(dish: special[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesVC.instantiate()
            controller.category = category[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailsVC.instantiate()
            controller.dishes = collectionView == popularCollectionView ? popular[indexPath.row] : special[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
