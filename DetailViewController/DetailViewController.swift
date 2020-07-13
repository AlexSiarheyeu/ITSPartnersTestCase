//
//  DetailViewController.swift
//  ITSPartner_Test
//
//  Created by Alexey Sergeev on 7/12/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var favoriteFruitLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var additionalInfoLabel: UILabel!
    
    //MARK: - Properties

    var name: String?
    var age: String?
    var gender: String?
    var eyeColor: String?
    var fruit: String?
    var status: Bool?
    var balance: String?

    //MARK: - View Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        ageLabel.text = age
        sexLabel.text = gender
        eyeColorLabel.text = eyeColor
        favoriteFruitLabel.text = fruit
        balanceLabel.text = balance
 
        //setup profile image view depends on gender
        
        if gender == Gender.male.rawValue {
            profileImageView.image = UIImage(named: "male")
        } else {
            profileImageView.image = UIImage(named: "female")
        }
        
        //setup online/offline status

        if status == true {
            statusLabel.text = "online"
            statusLabel.backgroundColor = UIColor(red: 63/255.0, green: 252/255.0, blue: 42/255.0, alpha: 0.5)
        } else {
            statusLabel.text = "offline"
            statusLabel.backgroundColor = UIColor(red: 220/255.0, green: 18/255.0, blue: 18/255.0, alpha: 0.5)
        }
        
        
        nameLabel.backgroundColor = UIColor(white: 0, alpha: 0.08)
        nameLabel.layer.cornerRadius = 10
        nameLabel.clipsToBounds = true
        
        additionalInfoLabel.backgroundColor = UIColor(white: 0, alpha: 0.08)
        additionalInfoLabel.layer.cornerRadius = 10
        additionalInfoLabel.clipsToBounds = true
        
        balanceLabel.backgroundColor  = UIColor(white: 0, alpha: 0.08)
        balanceLabel.layer.cornerRadius = 10
        balanceLabel.clipsToBounds = true
        
        statusLabel.layer.cornerRadius = 10
        statusLabel.clipsToBounds = true
        
    }
}
