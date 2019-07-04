//
//  EditProfileViewController.swift
//  Profile
//
//  Created by sooyeon Shim on 02/07/2019.
//  Copyright © 2019 sooyeon Shim. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    // MARK:- Properties
    // MARK: Outlet
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var profileImageview: UIImageView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var introductionTextview: UITextView!
    // MARK: Action
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        if friend == nil {
            UserInformation.sharedInstance.name = nameTextfield.text
            UserInformation.sharedInstance.email = emailTextfield.text
            UserInformation.sharedInstance.introduction = introductionTextview.text
            
            if selectedImage != nil {
                UserInformation.sharedInstance.image = selectedImage
            }
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButtonClicked(_ sender: UIBarButtonItem) {
        nameTextfield.endEditing(true)
        emailTextfield.endEditing(true)
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    // MARK: Defined Property
    let imagePicker = UIImagePickerController()
    var friend: Friends?
    var selectedImage: UIImage?
    
    // MARK:- Methods
    // MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        navigationBar.topItem?.title = friend?.name ?? UserInformation.sharedInstance.name
        
        nameTextfield.text = friend?.name ?? UserInformation.sharedInstance.name
        emailTextfield.text = friend?.email ?? UserInformation.sharedInstance.email
        introductionTextview.text = friend?.introduction ?? UserInformation.sharedInstance.introduction
        
        if friend == nil {
            if selectedImage == nil {
                profileImageview.image = UserInformation.sharedInstance.image ?? UIImage(named: "basic")
            } else {
                profileImageview.image = selectedImage
            }
        } else {
            profileImageview.image = UIImage(named: friend?.imageName ?? "basic")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        introductionTextview.layer.borderWidth = 0.3
        introductionTextview.layer.borderColor = UIColor.lightGray.cgColor
        introductionTextview.layer.cornerRadius = 10
        
        profileImageview.layer.cornerRadius = profileImageview.frame.width/2
        profileImageview.layer.masksToBounds = true
        //profileImageview.clipsToBounds = true
        
        profileImageview.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapImageView(_:)))
        profileImageview.addGestureRecognizer(tapGesture)
        imagePicker.delegate = self
    }
    
    // MARK: Defined Function
    @objc func tapImageView(_ sender: UITapGestureRecognizer) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: ImagePicker delegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        guard let newImage = info[.editedImage] as? UIImage
            else {
                fatalError("Please choose image again.")
        }
        
        selectedImage = newImage
        
        picker.dismiss(animated: true, completion: nil)
    }
}
