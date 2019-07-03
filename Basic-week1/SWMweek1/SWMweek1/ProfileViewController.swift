//
//  ProfileViewController.swift
//  SWMweek1
//
//  Created by Andrew Han on 30/06/2019.
//  Copyright © 2019 한상준. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var editBtnIsClicked:Bool?
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileImageView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var memo: UITextView!
    
    @IBOutlet weak var editBtnOutlet: UIButton!
    @IBAction func editBtn(_ sender: Any) {
        if (editBtnIsClicked ?? true) {
            editBtnOutlet.setTitle("편집", for: .normal)
            editBtnOutlet.setTitleColor(.defaultColor, for: .normal)
            
            name.isEnabled = false
            memo.isEditable = false
            editBtnIsClicked = false
        }else{
            editBtnOutlet.setTitle("저장", for: .normal)
            editBtnOutlet.setTitleColor(.redColor, for: .normal)
            name.isEnabled = true
            memo.isEditable = true
            editBtnIsClicked = true
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editBtnIsClicked = false
        hideKeyboardWhenTappedAround()
        name.isEnabled = false
        memo.isEditable = false
        profileImage.image = UIImage(named: "IMG_6277")
        profileImageView.circleCorner(isClipToBound: true)
        profileView.cornerBorderColor(width: 1, color: UIColor.grayColor.cgColor)
        profileImageView.cornerBorderColor(width: 1, color: UIColor.grayColor.cgColor)
        /*
        self.profileView.layer.borderWidth = 1
        self.profileView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        
        self.profileImageView.layer.borderWidth = 1
        self.profileImageView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        
        */
    }

}
