//
//  SetupSegmentControlHelper.swift
//  ITSPartner_Test
//
//  Created by Alexey Sergeev on 7/12/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

protocol SetupSegmentControlProtocol {
     func setupSegmentedControls(ageControl: UISegmentedControl, genderControl: UISegmentedControl)
    var internalNavBar: UINavigationController { get set }
}

class SetupSegmentControlHelper: SetupSegmentControlProtocol {
    var internalNavBar: UINavigationController
    
    init(internalNavBar: UINavigationController) {
        self.internalNavBar = internalNavBar
    }

    func setupSegmentedControls(ageControl: UISegmentedControl, genderControl: UISegmentedControl) {
        
        internalNavBar.navigationBar.addSubview(genderControl)
        internalNavBar.navigationBar.addSubview(ageControl)

        let navBar = internalNavBar.navigationBar
               
        NSLayoutConstraint.activate([
            genderControl.leadingAnchor.constraint(equalTo: navBar.leadingAnchor,constant: 10),
            genderControl.topAnchor.constraint(equalTo: navBar.topAnchor),
            genderControl.widthAnchor.constraint(equalToConstant: 170),
                   
            ageControl.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -10),
            ageControl.topAnchor.constraint(equalTo: navBar.topAnchor),
            ageControl.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
  
}
