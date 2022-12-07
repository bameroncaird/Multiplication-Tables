//
//  freePlayControllerFR.swift
//  Multiplication Tables
//
//  Created by cameron baird on 11/18/19.
//  Copyright © 2019 cameron baird. All rights reserved.
//

import UIKit

class freePlayControllerFR: UIViewController
{
    //declare outlets for numbers, text field, and custom keyboard
    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var enterButton: coolButton!
    @IBOutlet weak var textField: UITextField!
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
    
    //instantiate model to get the first question.  lazy variables aren't initialized until they're needed for something else.
    var newQuestion = QuestionModel()
    lazy var question = newQuestion.getMultQuestionData()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //display initial question
        displayQuestion(question: question)
    }
    
    
    //functions for displaying a question
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
    
    
    //action functions for the custom keyboard
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
        //remove the last character from the text box only if the text field contains characters
        if textField.text?.isEmpty == false
        {
            textField.text?.removeLast()
        }
    }
    @IBAction func enterPressed(_ sender: Any)
    {
        //check answer only if there's something in the text field
        if textField.text?.isEmpty == false
        {
            //answer is correct
            if textField.text == question.correctAnswer
            {
                //clear text field, turn green for a few seconds
                textField.backgroundColor = UIColor.green
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0)
                {
                    //clear text field and generate new question
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
                
                //turn it back to the original color after a delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0)
                {
                    self.textField.backgroundColor = UIColor.white
                    self.textField.text = ""
                }
            }
        }
    }
}
