//
//  QuestionModel.swift
//  Multiplication Tables
//
//  Created by cameron baird on 11/25/19.
//  Copyright © 2019 cameron baird. All rights reserved.
//

import Foundation
import UIKit

class QuestionModel
{
    var question = Question()
    
    let defaults = UserDefaults.standard
    
    func getMultQuestionData() -> Question
    {
        //get the two operands and the correct answer.  use this for the free response sections
        
        let num1 = Int.random(in: 1...12)
        question.firstString = "\(num1)"
        
        let num2 = Int.random(in: 1...12)
        question.secondString = "\(num2)"
        
        let correctAnswer = num1 * num2
        question.correctAnswer = "\(correctAnswer)"
        
        return question
    }
    
    func getMCQuestionData() -> Question
    {
        //get the two operands and the correct answer
        
        let num1 = Int.random(in: 1...12)
        question.firstString = "\(num1)"
        
        let num2 = Int.random(in: 1...12)
        question.secondString = "\(num2)"
        
        let correctAnswer = num1 * num2
        question.correctAnswer = "\(correctAnswer)"
        
        
        //need to get the rest of the answers, don't want duplicates and would like them to be multiples of either num1 or num2
        
        var answer2 = correctAnswer - num1
        if answer2 < 0 {
            answer2 = answer2 * -1
        }
        
        var answer3 = correctAnswer + num2
        if answer3 == answer2 {
            answer3 += 1
        }
        
        var answer4 = correctAnswer + (2 * num1)
        if answer4 == answer3 || answer4 == answer2 {
            answer4 += 10
        }
        
        question.answer2 = "\(answer2)"
        question.answer3 = "\(answer3)"
        question.answer4 = "\(answer4)"
        
        return question
    }
}
    
