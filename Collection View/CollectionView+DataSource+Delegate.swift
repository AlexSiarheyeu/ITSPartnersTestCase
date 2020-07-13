//
//  CollectionView+DataSource.swift
//  ITSPartner_Test
//
//  Created by Alexey Sergeev on 7/11/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

extension CollectionViewController {
    
    //MARK: - Collection view data source methods
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CustomCollectionViewCell
        
        guard let user = self.users[indexPath.row].name,
              let userAge = self.users[indexPath.row].age,
              let userGender = self.users[indexPath.row].gender else { return UICollectionViewCell().self }
               
        switch genderControl.selectedSegmentIndex {
                   
        case 0:
        cell.nameLabel.text = "\(user), \(userAge)"
                   
        if userGender == Gender.male.rawValue {
            cell.genderImageView.image = UIImage(named: "male")
        } else {
            cell.genderImageView.image = UIImage(named: "female")
        }
            
        case 1:
            guard let userMale = self.filteredMale[indexPath.row].name,
                  let userAgeMale = self.filteredMale[indexPath.row].age else { return UICollectionViewCell().self }
            
            cell.nameLabel.text = "\(userMale), \(userAgeMale)"
            cell.genderImageView.image = UIImage(named: "male")
            
        case 2:
            guard let userFemale = self.filteredFemale[indexPath.row].name,
                  let userAgeFemale = self.filteredFemale[indexPath.row].age else { return UICollectionViewCell().self }
            
            cell.nameLabel.text = "\(userFemale), \(userAgeFemale)"
            cell.genderImageView.image = UIImage(named: "female")
        default:
            break
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let checkSegment = genderControl.selectedSegmentIndex
               
        switch checkSegment {
        case 0: return users.count
        case 1: return filteredMale.count
        case 2: return filteredFemale.count
        default: break
        }
        return 0
    }
    
    //MARK: - Collection view delegate methods

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = DetailViewController(nibName: "DetailViewController", bundle: nil)
        vc.modalPresentationStyle = .formSheet
        
        switch genderControl.selectedSegmentIndex  {
        case 0: DetailViewControllerHelper.setUserInfoFields(vc: vc, array: users, indexPath: indexPath)
        case 1: DetailViewControllerHelper.setUserInfoFields(vc: vc, array: filteredMale, indexPath: indexPath)
        case 2: DetailViewControllerHelper.setUserInfoFields(vc: vc, array: filteredFemale, indexPath: indexPath)
        default: break
        }
        present(vc, animated: true, completion: nil)
    }
    
    
}


