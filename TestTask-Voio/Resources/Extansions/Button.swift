//
//  Button.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 28.03.2023.
//

import UIKit

extension UIButton {
    func sizeSymbol(name: String, size: CGFloat, weight: UIImage.SymbolWeight, scale: UIImage.SymbolScale){
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: size, weight: weight, scale: scale)
        let buttonImage = UIImage(systemName: name, withConfiguration: symbolConfiguration)
        self.setImage(buttonImage, for: .normal)
    }
}
