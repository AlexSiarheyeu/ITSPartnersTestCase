//
//  DetailViewControllerHelper.swift
//  ITSPartner_Test
//
//  Created by Alexey Sergeev on 7/13/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

class DetailViewControllerHelper {
    
    //MARK: - Method which set info about user from JSON to fields in Detail View Controller
    
   class func setUserInfoFields(vc: DetailViewController, array: [User], indexPath: IndexPath) {
    
            guard let name = array[indexPath.row].name,
                  let gender = array[indexPath.row].gender,
                  let age = array[indexPath.row].age,
                  let eyeColor = array[indexPath.row].eyeColor,
                  let favoriteFruit = array[indexPath.row].favoriteFruit,
                  let balance = array[indexPath.row].balance,
                  let status = array[indexPath.row].isActive else { return }
    
    
            vc.name = name
            vc.age = " Age: \(String(age))"
            vc.gender = " Sex: \(gender)"
            vc.eyeColor = " Eye color: \(eyeColor)"
            vc.fruit = " Favorite fruit: \(favoriteFruit)"
            vc.balance = " Balance: \(balance)"
            vc.status = status
        }
}
