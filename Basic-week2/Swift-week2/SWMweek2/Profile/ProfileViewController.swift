//
//  ProfileViewController.swift
//  Profile
//
//  Created by sooyeon Shim on 02/07/2019.
//  Copyright © 2019 sooyeon Shim. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK:- Properties
    // MARK: Outlet
    @IBOutlet var imageCollection: [UIImageView]!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var emailAdress: UILabel!
    @IBOutlet weak var introduction: UITextView!
    // MARK: Action
    @IBAction func deleteButtonClicked(_ sender: UIButton) {
        UserInformation.sharedInstance.initProperty()
        
        self.dismiss(animated: true, completion: nil)
    }
    // MARK: Defined Property
    let icons = ["message", "call", "facetime", "mail"]
    var friend: Friends?

    // MARK:- Methods
    // MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if friend == nil {
            imageCollection[0].image = UserInformation.sharedInstance.image ?? UIImage(named: "basic")
        } else {
            imageCollection[0].image = UIImage(named: friend?.imageName ?? "basic")
        }
        imageCollection[0].layer.cornerRadius = imageCollection[0].frame.width/2
        imageCollection[0].clipsToBounds = true
        
        for index in 0...3 {
            imageCollection[index+1].image = UIImage(named: icons[index])
            imageCollection[index+1].layer.cornerRadius = imageCollection[index+1].frame.width/2
            imageCollection[index+1].clipsToBounds = true
        }
        
        navigationItem.title = friend?.name ?? UserInformation.sharedInstance.name
        name.text = friend?.name ?? UserInformation.sharedInstance.name
        emailAdress.text = friend?.email ?? UserInformation.sharedInstance.email
        introduction.text = friend?.introduction ?? UserInformation.sharedInstance.introduction
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introduction.isEditable = false
    }
    
    // MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editProfile" {
            if let destination = segue.destination as? EditProfileViewController {
                if friend == nil {
                    destination.friend = nil
                } else {
                    destination.friend = friend
                }
            }
        }
    }
    
    

}

