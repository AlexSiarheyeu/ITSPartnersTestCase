//
//  User.swift
//  ITSPartner_Test
//
//  Created by Alexey Sergeev on 7/10/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import Foundation

struct User: Decodable, Equatable {
    var index: Int?
    var id: String?
    var name: String?
    var picture: String?
    var age: Int?
    var gender: String?
    var eyeColor: String?
    var favoriteFruit: String?
    var balance: String?
    var uid: String?
    var isActive: Bool?
}

