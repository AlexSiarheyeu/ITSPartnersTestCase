//
//  FillteringModule.swift
//  ITSPartner_Test
//
//  Created by Alexey Sergeev on 7/12/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

enum Gender: String {
    case male
    case female
}

class FillteringMode {
    
    //MARK: - Sort by age function
    
    static func sortUsersByAgeUsingSegmentedControls(ageControl: UISegmentedControl, genderControl: UISegmentedControl, allUsers: inout [User], maleUsers: inout [User], femaleUsers: inout [User] ) {

            let ageSelectedIndex = ageControl.selectedSegmentIndex
            let genderSelectedIndex = genderControl.selectedSegmentIndex

            switch ageSelectedIndex {
            case 0: sortOrderedDescending(array: &allUsers)
                
                switch genderSelectedIndex {
                case 1: sortOrderedDescending(array: &maleUsers)
                case 2: sortOrderedDescending(array: &femaleUsers)
                default: break
                }
                
            case 1: sortOrderedAscending(array: &allUsers)
                
                switch genderSelectedIndex {
                case 1: sortOrderedAscending(array: &maleUsers)
                case 2: sortOrderedAscending(array: &femaleUsers)
                default: break
                }
                
            default: break
    }
}
    //MARK: - Private methods for sort by age function
    
   fileprivate static func  sortOrderedDescending (array: inout [User]) {
        array.sort { (u1, u2) -> Bool in
          if let user1 = u1.age, let user2 = u2.age {
            return user1 > user2
          }
            return false
          }
    }

    fileprivate static func sortOrderedAscending (array: inout [User]) {
        array.sort { (u1, u2) -> Bool in
          if let user1 = u1.age, let user2 = u2.age {
            return user1 < user2
           }
            return false
           }
    }
    
    //MARK: - Sort by gender method
    
    static func sortByGender(allUsers: [User], maleUsers: inout [User], femaleUsers: inout [User], genderControl: UISegmentedControl) {
        
        for user in allUsers {
        guard let gender = user.gender else {return}

        switch genderControl.selectedSegmentIndex {
        case 1:
            if gender.hasPrefix(Gender.male.rawValue) {
                if maleUsers.contains(user) { return }
            maleUsers.append(user)
        }
        case 2:
            if gender.hasPrefix(Gender.female.rawValue) {
                if femaleUsers.contains(user) { return }
            femaleUsers.append(user)
         }
         default: break
     }
    }
    }
}

