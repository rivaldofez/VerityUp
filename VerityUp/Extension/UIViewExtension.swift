//
//  UIViewExtension.swift
//  VerityUp
//
//  Created by Rivaldo Fernandes on 10/04/22.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get{return self.cornerRadius}
        
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
