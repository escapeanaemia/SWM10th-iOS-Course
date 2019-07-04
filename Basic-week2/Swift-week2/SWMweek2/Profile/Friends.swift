//
//  Friends.swift
//  Profile
//
//  Created by sooyeon Shim on 03/07/2019.
//  Copyright © 2019 sooyeon Shim. All rights reserved.
//

import Foundation

struct Friends: Codable {
    let name: String
    let email: String
    let introduction: String
    let imageName: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case email = "email"
        case introduction = "introduction"
        case imageName = "image"
    }
}
