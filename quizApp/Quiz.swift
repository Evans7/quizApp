//
//  Quiz.swift
//  quizApp
//
//  Created by user235857 on 3/24/24.
//

import Foundation
class Quiz{
    var question: String
    var option1: String
    var option2: String
    var option3: String
    var option4: String
    var correctOption: Int
    init(question: String,option1: String, option2: String, option3: String, option4: String, correctOption: Int){
        self.question = question
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.option4 = option4
        self.correctOption = correctOption
        }
    
    init(){
        self.question=""
        self.option1=""
        self.option2=""
        self.option3=""
        self.option4=""
        self.correctOption = -1
    }
    
}
