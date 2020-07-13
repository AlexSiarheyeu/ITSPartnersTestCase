//
//  TableViewController.swift
//  ITSPartner_Test
//
//  Created by Alexey Sergeev on 7/10/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController  {
    
    //MARK: - Computed properties
    
    var users: [User] = []; var filteredMale:[User] = []; var filteredFemale:[User] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
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

    //MARK: - View Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
        
        MainDownloader.loadUsers { (user) in
            self.users.append(contentsOf: user)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
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
        
        addRefreshControl()
    }

    //MARK: - Action methods for selectors
    func addRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = .lightGray
        refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        guard let refreshControl = refreshControl else {return}
        tableView.addSubview(refreshControl)
    }
    
    @objc func handleRefresh() {
        refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    @objc func hadleTap() {
        genderControl.selectedSegmentIndex = 0
        tableView.reloadData()
    }
    
    @objc func sortByGenderAction(sender: UISegmentedControl) {
        tableView.reloadData()
        FillteringMode.sortByGender(allUsers: users, maleUsers: &filteredMale, femaleUsers: &filteredFemale, genderControl: genderControl)
        }

    @objc func sortByAgeAction() {
        tableView.reloadData()
        FillteringMode.sortUsersByAgeUsingSegmentedControls(ageControl: ageControl, genderControl: genderControl, allUsers: &users, maleUsers: &filteredMale, femaleUsers: &filteredFemale)
        }
}
