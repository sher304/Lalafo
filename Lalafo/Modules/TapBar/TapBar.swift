//
//  TapBar.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 25/9/22.
//

import UIKit
import SnapKit

class TapBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupTapConstraints()
    }
    
    private func createTapController(vc: UIViewController, title: String, icon: UIImage) -> UIViewController{
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = icon
        navController.navigationBar.prefersLargeTitles = true
        vc.navigationItem.title = title
        return navController
    }
    
    private func setupTapConstraints(){
        viewControllers = [
            createTapController(vc: HomeBuilder.build(), title: "Home", icon: UIImage(systemName: "homekit")!),
            createTapController(vc: CartBuilder.build(), title: "Cart", icon: UIImage(systemName: "suitcase.cart")!)
        ]
    }
    
}
