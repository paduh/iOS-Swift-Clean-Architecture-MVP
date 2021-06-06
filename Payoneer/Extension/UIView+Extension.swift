//
//  UIView+Extension.swift
//  Payoneer
//
//  Created by Aduh Perfect on 06/06/2021.
//

import UIKit


public extension UIView {
   
   @IBInspectable var borderWidth: CGFloat {
       set {
           layer.borderWidth = newValue
       }
       get {
           return layer.borderWidth
       }
   }
   
   @IBInspectable var cornerRadius: CGFloat {
       set {
           layer.cornerRadius = newValue
       }
       get {
           return layer.cornerRadius
       }
   }
   
   @IBInspectable var borderColor: UIColor? {
       set {
           guard let uiColor = newValue else { return }
           layer.borderColor = uiColor.cgColor
       }
       get {
           guard let color = layer.borderColor else { return nil }
           return UIColor(cgColor: color)
       }
   }
    
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
