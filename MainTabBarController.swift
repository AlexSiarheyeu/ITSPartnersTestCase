//
//  ViewController.swift
//  ITSPartner_Test
//
//  Created by Alexey Sergeev on 7/10/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    //MARK: - View Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    //MARK: - Private methods
    
    fileprivate func setupViewControllers() {
        
        let collectionViewController = templateNavController(unselectedImage: UIImage(systemName: "table.fill"), selectedImage: UIImage(systemName: "table"), rootViewController: CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        collectionViewController.title = "Collection view"
        
        
        let tableViewController = templateNavController(unselectedImage: UIImage(systemName: "rectangle.grid.1x2.fill"), selectedImage: UIImage(systemName: "rectangle.grid.1x2"), rootViewController: TableViewController())
        tableViewController.title = "Table View"
        
        viewControllers = [collectionViewController, tableViewController]
    }
    
    fileprivate func templateNavController(unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
    
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        
        return navController
    }
}

