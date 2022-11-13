//
//  MainViewController.swift
//  Bankey
//
//  Created by Miguel Solans on 31/05/2022.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad();
        setupViews();
        setupTabBar();
    }
    
    private func setupViews() {
        let summaryViewController = AccountSummaryViewController();
        let moveMoneyViewController = MoveMoneyViewController();
        let moreViewController = MoreViewController();
        
        summaryViewController.setTabBarImage(imageName: "creditcard", title: "Summary");
        moveMoneyViewController.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Move Money");
        moreViewController.setTabBarImage(imageName: "ellipsis.circle", title: "More");
        
        let summaryNavigationController = UINavigationController(rootViewController: summaryViewController);
        let moveMoneyNavigationController = UINavigationController(rootViewController: moveMoneyViewController);
        let moreNavigationController = UINavigationController(rootViewController: moreViewController);
        
        summaryNavigationController.navigationBar.barTintColor = appColor;
        hideNavigationBarLine(summaryNavigationController.navigationBar)
        
        let tabBarList = [ summaryNavigationController, moveMoneyNavigationController, moreNavigationController ];
        viewControllers = tabBarList;
    }
    
    private func setupTabBar() {
        tabBar.tintColor = appColor;
        tabBar.isTranslucent = false
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let image = UIImage();
        navigationBar.shadowImage = image;
        navigationBar.setBackgroundImage(image, for: .default);
        navigationBar.isTranslucent = false
    }
}

// Dummy ViewControllers
class MoveMoneyViewController : UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange;
    }
}
class MoreViewController : UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple;
    }
}
