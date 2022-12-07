//
//  gradientButton.swift
//  Multiplication Tables
//
//  Created by cameron baird on 11/11/19.
//  Copyright © 2019 cameron baird. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class gradientButton: UIButton
{
    //make a gradient layer class so that we have access to the properties of the class
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
