//
//  MainTabVC.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 26.06.2023.
//

import UIKit

class MainTabVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor(named: "accentColor")
        
        let menuVC = MenuAssembly().configure()
        menuVC.tabBarItem.title = "Меню"
        menuVC.tabBarItem.image = UIImage(named: "menuIcon")
        
        let cartVC = CartAssembly().configure()
        cartVC.tabBarItem.title = "Корзина"
        cartVC.tabBarItem.image = UIImage(named: "shoppingCartIcon")
        
        let menuNav = UINavigationController(rootViewController: menuVC)
        
        self.viewControllers = [menuVC, cartVC]
    }
}
