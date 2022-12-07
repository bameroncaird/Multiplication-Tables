//
//  summaryVC.swift
//  Multiplication Tables
//
//  Created by cameron baird on 12/16/19.
//  Copyright © 2019 cameron baird. All rights reserved.
//

import UIKit

class summaryVC: UIViewController
{
    //set up variables to track the score
    var score = 0
    var isHighScore = 0
    
    //outlets for labels
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var message: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        //setup the score and high score to display the right messages
        scoreLabel.text = "\(score)"
        
        if isHighScore == 1
        {
            //tell the user congrats, it's a high score
            message.text = "New High Score!"
        }
        else
        {
            //tell the user to try again, it's not a high score
            message.text = "Try again for a \nNew High Score!"
        }
    }
}
