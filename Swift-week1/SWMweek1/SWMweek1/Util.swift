//
//  Util.swift
//  SWMweek1
//
//  Created by 한상준 on 29/06/2019.
//  Copyright © 2019 한상준. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static var grayColor: UIColor  { return UIColor(red: 222/255, green: 225/255, blue: 227/255, alpha: 1) }
    static var redColor: UIColor { return UIColor(red: 1, green: 0, blue: 0, alpha: 1) }
    static var defaultColor: UIColor { return
        UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
    }
}

extension UIView {
    //MARK: 테두리 색넣기
    func cornerBorderColor(width:CGFloat, color:CGColor){
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
    
    //MARK: 테두리 가장자리 둥글게
    func roundConer(radius:CGFloat, isMasksBounded:Bool){
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = isMasksBounded
    }
    //MARK: 원만들기
    func circleCorner(isClipToBound:Bool){
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = isClipToBound
    }
    //MARK: 그림자1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    //MARK: 그림자2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    //MARK: 탭 클릭씨
    func addTapGesture(tapNumber: Int, target: Any, action: Selector) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = tapNumber
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
}
extension UIImage {
    func circleImage() -> UIImage {
        let imageView: UIImageView = UIImageView(image: self)
        let layer = imageView.layer
        layer.masksToBounds = true
        layer.cornerRadius = imageView.frame.width / 2
        UIGraphicsBeginImageContext(imageView.bounds.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return roundedImage!
    }
}

extension UIViewController {
    //MARK: 키보드 밖 선택시 키보드 숨기기
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    //MARK: 키보드 호출 시 뷰 위, 아래 이동
    func upAndDownWhenKeyboardShow(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}
