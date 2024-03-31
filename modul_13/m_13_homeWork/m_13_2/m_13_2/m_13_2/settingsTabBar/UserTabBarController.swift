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

        self.setupTabs()
        
        //self.tabBar.barTintColor = .red
        self.tabBar.tintColor = .systemBlue
        self.tabBar.unselectedItemTintColor = .black
        self.tabBar.backgroundColor = .white

    }
    
    
    
    
    private func setupTabs() {
        
        let home = self.creatNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeViewController())
        
        let contact = self.creatNav(with: "Contact", and: UIImage(systemName: "person.circle"), vc: SearchViewController())
        
        let settings = self.creatNav(with: "Settings", and: UIImage(systemName: "gear"), vc: ProfileViewController())
        
        self.setViewControllers([home, contact, settings], animated: true)
    }
    
    
    private func creatNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title + " Controller"
        
        return nav
    }
    
}
    
    
    
    
    

