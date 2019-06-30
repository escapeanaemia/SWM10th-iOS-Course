//
//  ViewController.swift
//  SWMweek1
//
//  Created by 한상준 on 29/06/2019.
//  Copyright © 2019 한상준. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var memoTextView: UITextView!
    @IBAction func messageBtn(_ sender: Any) {
        
    }
    @IBAction func callBtn(_ sender: Any) {
        
    }
    @IBAction func videoBtn(_ sender: Any) {
        
    }
    @IBAction func emailBtn(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.image = UIImage(named: "IMG_6277")?.circleImage()
        numberTextField.delegate = self
        emailTextField.delegate = self
        locationTextField.delegate = self
        hideKeyboardWhenTappedAround()
        upAndDownWhenKeyboardShow()
    }
    
    

}

extension ViewController : UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.placeholder = "텍스트를 입력해주세요"
    }
}

extension ViewController : UITextViewDelegate{
    
}
