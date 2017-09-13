//
//  UIView.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import UIKit

extension UIView {
    func setAnchor(top: NSLayoutYAxisAnchor?, paddingTop: CGFloat, left: NSLayoutXAxisAnchor?, paddingLeft: CGFloat, right: NSLayoutXAxisAnchor?, paddingRight: CGFloat, bottom: NSLayoutYAxisAnchor?, paddingBottom: CGFloat, width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width > 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height > 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
