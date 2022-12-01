//
//  ViewController.swift
//  UIKitDz
//
//  Created by Balik on 16.09.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navControl()
        setTabBar()
        
    }
    func navControl() {
        let mainVC = UINavigationController(rootViewController: ViewController())
        
        mainVC.tabBarItem.image = UIImage(systemName: "paperplane.fill")
        
        viewControllers = [mainVC]
    }
    
    func setTabBar() {
        tabBar.backgroundColor = .systemGray6
    }

}

