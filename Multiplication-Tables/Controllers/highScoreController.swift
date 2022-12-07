//
//  highScoreController.swift
//  Multiplication Tables
//
//  Created by cameron baird on 11/13/19.
//  Copyright © 2019 cameron baird. All rights reserved.
//

import UIKit

class highScoreController: UIViewController
{
    //outlet for the score label
    @IBOutlet weak var highScore: UILabel!
    
    //instantiate the timed controller so that we can access some of its data
    let timedVC = timedPlayController()
    
    //default setup
    lazy var defaults = timedVC.defaults
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //display the high score in the label box
        displayHighScore()
    }
    
    
    
    func displayHighScore()
    {
        if let score = defaults.value(forKey: timedVC.highScoreString) as? Int
        {
            //the high score exists in user defaults, so display it in the label text
            highScore?.text = "\(score)"
        }
        else
        {
            //high score does not exist, so set a default value of zero in the label
            highScore?.text = "0"
        }
    }
    
}
