//
//  TableView+DataSource.swift
//  ITSPartner_Test
//
//  Created by Alexey Sergeev on 7/10/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

extension TableViewController {
     
    //MARK: Table View data source methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CustomTableViewCell

        guard let user = self.users[indexPath.row].name,
              let userAge = self.users[indexPath.row].age,
              let userGender = self.users[indexPath.row].gender else { return UITableViewCell().self }
        
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
                  let userAgeMale = self.filteredMale[indexPath.row].age else { return UITableViewCell().self }
            cell.nameLabel.text = "\(userMale), \(userAgeMale)"
            cell.genderImageView.image = UIImage(named: "male")
        case 2:
            guard let userFemale = self.filteredFemale[indexPath.row].name,
                  let userAgeFemale = self.filteredFemale[indexPath.row].age else { return UITableViewCell().self }
            cell.nameLabel.text = "\(userFemale), \(userAgeFemale)"
            cell.genderImageView.image = UIImage(named: "female")
        default:
            break
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let checkSegment = genderControl.selectedSegmentIndex
        
        switch checkSegment {
        case 0: return users.count
        case 1: return filteredMale.count
        case 2: return filteredFemale.count
        default: break
        }
        
        return 0
    }
    
    //MARK: Table View delegate methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
