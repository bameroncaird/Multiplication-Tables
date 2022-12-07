//
//  freePlayController.swift
//  Multiplication Tables
//
//  Created by cameron baird on 11/30/19.
//  Copyright © 2019 cameron baird. All rights reserved.
//

import UIKit

class timedPlayController: UIViewController
{
    //outlets for the numbers, labels, and keyboard
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var enterAnswer: coolButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var n1: coolButton!
    @IBOutlet weak var n2: coolButton!
    @IBOutlet weak var n3: coolButton!
    @IBOutlet weak var n4: coolButton!
    @IBOutlet weak var n5: coolButton!
    @IBOutlet weak var n6: coolButton!
    @IBOutlet weak var n7: coolButton!
    @IBOutlet weak var n8: coolButton!
    @IBOutlet weak var n9: coolButton!
    @IBOutlet weak var n0: coolButton!
    @IBOutlet weak var deleteButton: coolButton!
    
    //make timer
    var timer: Timer?
    var seconds = 60
    
    //get a question from the model
    var newQuestion = QuestionModel()
    lazy var question = newQuestion.getMultQuestionData()
    
    //set up user defaults so that you can store the high score later with that string
    let highScoreString = "highScore"
    let defaults = UserDefaults.standard
    
    //set initial score variable to 0
    var score = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //setup timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeElapsed), userInfo: nil, repeats: true)
        timerLabel?.text = "Time remaining: \(seconds)"

        //get question data and display on screen
        displayQuestion(question: question)
    }
    
    //function that handles the timer
    @objc func timeElapsed()
    {
        seconds -= 1
        timerLabel.text = "Time remaining: \(seconds)"
        
        if seconds <= 0
        {
            //stop timer
            timer?.invalidate()
            timerLabel?.text = "Time's up!"
            
            //delay for a bit before transitioning to the summary controller
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0)
            {
                //transition to summary page
                self.performSegue(withIdentifier: "summaryTransition", sender: nil)
                
                //check for high scores and store them if necessary
                self.checkHighScores()
            }
        }
    }
    
    //want to pass data to the summary vc.  send it the necessary data with this prepare function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let newVC = segue.destination as? summaryVC
        {
            //set the score variable in the summary vc to the score variable from this one
            newVC.score = self.score
            
            //check if it's a high score and update the variable in summary vc so that it will display the right message
            if let highScore = defaults.value(forKey: highScoreString) as? Int
            {
                //the high score exists in user defaults, so compare that with the current score
                if(self.score > highScore)
                {
                    newVC.isHighScore = 1
                }
            }
            else
            {
                //the high score does not exist in user defaults, so the current score will always be a high score
                newVC.isHighScore = 1
            }
        }
    }
    
    func checkHighScores()
    {
        //checks if score is higher than the one stored in user defaults. if so, replaces that score in user defaults
        
        if let highScore = defaults.value(forKey: highScoreString) as? Int
        {
            //the high score exists in user defaults
            if(score > highScore) {
                defaults.set(score, forKey: highScoreString)
            }
        }
        else
        {
            //the high score does not exist in user defaults, just set the score
            defaults.set(score, forKey: highScoreString)
        }
    }
    
    
    //functions for displaying data in labels
    func displayQuestion(question: Question)
    {
        //display the two random numbers
        updateFirstLabel(question: question)
        updateSecondLabel(question: question)
    }
    func updateFirstLabel(question: Question)
    {
        number1?.text = question.firstString
    }
    func updateSecondLabel(question: Question)
    {
        number2?.text = question.secondString
    }
    func updateScoreLabel(scoreValue: Int)
    {
        scoreLabel?.text = "\(scoreValue)"
    }
    
    
    //functions for custom keyboard
    @IBAction func n1Tapped(_ sender: Any)
    {
        textField.text?.append("1")
    }
    @IBAction func n2Tapped(_ sender: Any)
    {
        textField.text?.append("2")
    }
    @IBAction func n3Tapped(_ sender: Any)
    {
        textField.text?.append("3")
    }
    @IBAction func n4Tapped(_ sender: Any)
    {
        textField.text?.append("4")
    }
    @IBAction func n5Tapped(_ sender: Any)
    {
        textField.text?.append("5")
    }
    @IBAction func n6Tapped(_ sender: Any)
    {
        textField.text?.append("6")
    }
    @IBAction func n7Tapped(_ sender: Any)
    {
        textField.text?.append("7")
    }
    @IBAction func n8Tapped(_ sender: Any)
    {
        textField.text?.append("8")
    }
    @IBAction func n9Tapped(_ sender: Any)
    {
        textField.text?.append("9")
    }
    @IBAction func n0Tapped(_ sender: Any)
    {
        textField.text?.append("0")
    }
    @IBAction func deleteTapped(_ sender: Any)
    {
        if textField.text?.isEmpty == false
        {
            textField.text?.removeLast()
        }
    }
    @IBAction func enterPressed(_ sender: Any)
    {
        //should only execute code if the timer is still running and there's stuff in the text box.
        if seconds > 0 && textField.text?.isEmpty == false
        {
            //answer is correct
            if textField.text == question.correctAnswer
            {
                //turn green
                textField.backgroundColor = UIColor.green
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0)
                {
                    //clear text field, make new q, inc score
                    self.score += 1
                    self.updateScoreLabel(scoreValue: self.score)
                    
                    self.textField.text = ""
                    self.textField.backgroundColor = UIColor.white
                    self.question = self.newQuestion.getMultQuestionData()
                    self.displayQuestion(question: self.question)
                    
                }
            }
            //answer is incorrect
            else
            {
                //make the button shake and turn it red
                textField.backgroundColor = UIColor.red
                textField.shake(duration: 0.5, values: [-12.0, 12,0, -12.0, 12.0, -6.0, 6.0, -3.0, 3.0, 0.0])
                
                //turn it back to the original color
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0)
                {
                    self.textField.backgroundColor = UIColor.white
                    self.textField.text = ""
                }
            }
        }
    }
}
