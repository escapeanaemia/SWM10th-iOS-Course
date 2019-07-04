//
//  UserInformation.swift
//  Profile
//
//  Created by sooyeon Shim on 02/07/2019.
//  Copyright © 2019 sooyeon Shim. All rights reserved.
//

import UIKit

class UserInformation {
    static let sharedInstance = UserInformation()
    
    var name: String?
    var email: String?
    var introduction: String?
    var image: UIImage?
    
    func initProperty() {
        name = "Sooyeon"
        email = "syshim77@gmail.com"
        introduction = "[관심기술분야]\niOS / 딥러닝 / 머신러닝"
        image = UIImage(named: "sooyeon")
    }
}
