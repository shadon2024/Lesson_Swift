//
//  UserTabBarController.swift
//  m_13_2
//
//  Created by Admin on 29.03.2024.
//

import UIKit

class UserTabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .white
        
        configureTabs()

    }
    
    private func configureTabs() {
        let vc1 = HomeViewController()
        let vc2 = SearchViewController()
        let vc3 = ProfileViewController()
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc3.tabBarItem.image = UIImage(systemName: "person")
        
        vc1.title = "Home"
        vc2.tabBarItem.title = "Search"
        vc3.title = "Profile"
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .systemGray6
        
        setViewControllers([nav1, nav2, nav3], animated: true)
        
    }
    

}
