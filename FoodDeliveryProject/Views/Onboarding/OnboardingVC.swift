//
//  OnboardingVC.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 24/01/24.
//

import UIKit

class OnboardingVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    
    var slides : [OnboardingSlides] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Next", for: .normal)
            } else {
                nextBtn.setTitle("Get Started", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [OnboardingSlides(title: "Delicious Dishes", description: "Experience a veriety of amazing dishes from different cultures around the world", image: UIImage(named: "ic_Alamy")!), OnboardingSlides(title: "World-Class Chefs", description: "Our dishes are prepared by only the best", image: UIImage(named: "ic_World-Class-Chefs")!), OnboardingSlides(title: "Instant World-wide Delivery", description: "Your order will be delivered instantly irrespective of your location around the world", image: UIImage(named: "ic_Food Delivery Service")!)]
        print(slides.count)
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCVC.identifier, for: indexPath) as! OnboardingCVC
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
