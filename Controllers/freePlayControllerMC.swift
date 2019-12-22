//
//  freePlayController.swift
//  Multiplication Tables
//
//  Created by cameron baird on 11/15/19.
//  Copyright © 2019 cameron baird. All rights reserved.
//

import UIKit

class freePlayControllerMC: UIViewController
{
    //declare outlets for both numbers and all of the buttons
    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var button1: coolButton!
    @IBOutlet weak var button2: coolButton!
    @IBOutlet weak var button3: coolButton!
    @IBOutlet weak var button4: coolButton!
    
    //instantiate model to get the first question.  note: lazy variables are only initialized when they're needed for something else
    var newQuestion = QuestionModel()
    lazy var question = newQuestion.getMCQuestionData()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //displays the initial question on the screen
        displayQuestion(question: question)
    }
    
    
    //functions for question display
    func displayQuestion(question: Question)
    {
        //display the two random numbers
        updateFirstLabel(question: question)
        updateSecondLabel(question: question)
        
        //display answers on buttons, one being correct
        var buttonArray = [button1, button2, button3, button4]
        let answerArray = [question.correctAnswer, question.answer2, question.answer3, question.answer4]
        
        //shuffle the array of answers so that the correct answer appears on a different button each time
        buttonArray.shuffle()
        for i in 0...3
        {
            buttonArray[i]?.setTitle(answerArray[i], for: .normal)
        }
    }
    func updateFirstLabel(question: Question)
    {
        number1?.text = question.firstString
    }
    func updateSecondLabel(question: Question)
    {
        number2?.text = question.secondString
    }
    
    
    
    //action functions for each button
    @IBAction func button1Tapped(_ sender: Any)
    {
        checkButtonAnswer(button: button1)
    }
    @IBAction func button2Tapped(_ sender: Any)
    {
        checkButtonAnswer(button: button2)
    }
    @IBAction func button3Tapped(_ sender: Any)
    {
        checkButtonAnswer(button: button3)
    }
    @IBAction func button4Tapped(_ sender: Any)
    {
        checkButtonAnswer(button: button4)
    }
    
    
    //checks the answer in a tapped button and responds appropriately with animations
    func checkButtonAnswer(button: coolButton)
    {
        if button.titleLabel?.text == question.correctAnswer
        {
            //turn the button color green
            button.backgroundColor = UIColor.green
            
            //turn the button back to its original color after a few seconds. get new question and display it
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0)
            {
                button.backgroundColor = UIColor(red: 69/255, green: 43/255, blue: 89/255, alpha: 1.0)
                self.question = self.newQuestion.getMCQuestionData()
                self.displayQuestion(question: self.question)
            }
        }
        else
        {
            //make the button shake and turn it red
            button.backgroundColor = UIColor.red
            button.shake(duration: 0.5, values: [-12.0, 12,0, -12.0, 12.0, -6.0, 6.0, -3.0, 3.0, 0.0])
            
            //turn it back to the original color
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0)
            {
                button.backgroundColor = UIColor(red: 69/255, green: 43/255, blue: 89/255, alpha: 1.0)
            }
        }
    }
}
