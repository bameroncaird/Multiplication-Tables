//  want buttons to shake when you get the answer wrong

//
//  shake.swift
//  Multiplication Tables
//
//  Created by cameron baird on 12/15/19.
//  Copyright © 2019 cameron baird. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    func shake(duration: TimeInterval = 0.5, values: [CGFloat])
    {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        
        animation.duration = duration
        animation.values = values
        self.layer.add(animation, forKey: "shake")
    }
}
