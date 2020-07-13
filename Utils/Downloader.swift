//
//  Downloader.swift
//  ITSPartner_Test
//
//  Created by Alexey Sergeev on 7/10/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit


class MainDownloader {
    
    class func loadUsers(completion: @escaping ([User]) -> Void) {
        
        let urlString = "https://www.json-generator.com/api/json/get/clyWAUbaxu?indent=2"
        
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let error = error {
                print("Failed to download users", error)
                return
            }
            guard let data =
                data else {return}

            guard let users = try? JSONDecoder().decode([User].self, from: data) else {return}
            completion(users)
        }.resume()
    }
}


 
