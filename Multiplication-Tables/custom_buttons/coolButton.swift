//
//  coolUIButton.swift
//  Multiplication Tables
//
//  Created by cameron baird on 11/8/19.
//  Copyright © 2019 cameron baird. All rights reserved.
//

import Foundation
import UIKit

//don't forget to change the class in the identity inspector to make these changes work

//first, need to mention IBDesignable
@IBDesignable class coolButton: UIButton
{
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    let gradient = CAGradientLayer()
    
    //make two IB Inspectables, one for the top color and one for the bottom
    @IBInspectable var topColor: UIColor? {
        didSet {
            setGradient(topColor: topColor, bottomColor: bottomColor)
        }
    }
    
    @IBInspectable var bottomColor: UIColor? {
        didSet {
            setGradient(topColor: topColor, bottomColor: bottomColor)
        }
    }
    
    private func setGradient(topColor: UIColor?, bottomColor: UIColor?)
    {
        if let topColor = topColor, let bottomColor = bottomColor
        {
            gradient.frame = bounds
            gradient.colors = [topColor.cgColor, bottomColor.cgColor]
            gradient.borderColor = layer.borderColor
            gradient.borderWidth = layer.borderWidth
            gradient.cornerRadius = layer.cornerRadius
            layer.insertSublayer(gradient, at: 0)
        }
        else
        {
            gradient.removeFromSuperlayer()
        }
    }
}
