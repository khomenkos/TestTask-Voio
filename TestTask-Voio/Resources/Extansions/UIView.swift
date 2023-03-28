//
//  UIView+Extensions.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import UIKit

extension UIView {    
    func setDimensions(width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setupShadow(radius: Double, shadowOpacity: Float) {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = radius
        layer.shadowOpacity = shadowOpacity
    }
}
