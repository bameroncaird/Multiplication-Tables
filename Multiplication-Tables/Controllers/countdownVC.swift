//
//  countdownVC.swift
//  Multiplication Tables
//
//  Created by cameron baird on 12/16/19.
//  Copyright © 2019 cameron baird. All rights reserved.
//

import UIKit

// this controller gives the user a countdown before playing the timed quiz section

class countdownVC: UIViewController
{
    //make timer and corresponding label outlet
    var timer: Timer?
    @IBOutlet weak var timerLabel: UILabel!
    
    //give the user 5 seconds of prep time
    var seconds = 5
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        //set up the timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeElapsed), userInfo: nil, repeats: true)
    }
    
    //function to handle the timer and display its data
    @objc func timeElapsed()
    {
        seconds -= 1
        timerLabel.text = "\(seconds)"
        
        if seconds <= 0
        {
            //stop timer
            timer?.invalidate()
            
            //transition to the timed play view
            performSegue(withIdentifier: "countdownZero", sender: nil)
        }
    }
}
