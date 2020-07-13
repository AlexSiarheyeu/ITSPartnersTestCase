//
//  CollectionViewController.swift
//  ITSPartner_Test
//
//  Created by Alexey Sergeev on 7/10/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    //MARK: - Properties

     var users: [User] = []; var filteredMale:[User] = []; var filteredFemale:[User] = [] {
           didSet {
               DispatchQueue.main.async {
                   self.collectionView.reloadData()
               }
           }
       }
    
    let genderControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["All", "Male", "Female"])
        sc.backgroundColor = .cyan
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    let ageControl: UISegmentedControl = {
        guard let ascending = UIImage(systemName: "arrow.up.circle.fill"),
              let descending = UIImage(systemName: "arrow.down.circle.fill") else { return UISegmentedControl()}
        let sc = UISegmentedControl(items: [ascending, descending])
        sc.backgroundColor = .cyan
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    var refreshControl = UIRefreshControl()

    //MARK: - View Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellId")

        MainDownloader.loadUsers { (user) in
            self.users.append(contentsOf: user)
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        //setup refresh control
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        collectionView.addSubview(refreshControl)
        
        //add gesture to navigation bar
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hadleTap))
        navigationController?.navigationBar.addGestureRecognizer(tapGesture)
        
        //setup segmented controls to navigation bar
        guard let navBar = navigationController else {return}
        let helper = SetupSegmentControlHelper(internalNavBar: navBar)
        helper.setupSegmentedControls(ageControl: ageControl, genderControl: genderControl)
        
        //add actions to selected indexes of controls
        genderControl.addTarget(self, action: #selector(sortByGenderAction), for:.allEvents)
        ageControl.addTarget(self, action: #selector(sortByAgeAction), for: .allEvents)
    }
    
    //MARK: Collection View delegate flow layout methods
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 55)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    //MARK: - Action methods for selectors
    @objc func handleRefresh() {
        collectionView.reloadData()
        refreshControl.endRefreshing()
    }
   
    @objc func hadleTap() {
        genderControl.selectedSegmentIndex = 0
        collectionView.reloadData()
    }
    
    @objc func sortByGenderAction(sender: UISegmentedControl) {
        collectionView.reloadData()
        FillteringMode.sortByGender(allUsers: users, maleUsers: &filteredMale, femaleUsers: &filteredFemale, genderControl: genderControl)
    }
     
     @objc func sortByAgeAction() {
        collectionView.reloadData()
        FillteringMode.sortUsersByAgeUsingSegmentedControls(ageControl: ageControl, genderControl: genderControl, allUsers: &users, maleUsers: &filteredMale, femaleUsers: &filteredFemale)
        }
}



