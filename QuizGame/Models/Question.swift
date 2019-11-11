//
//  Question.swift
//  QuizGame
//
//  Created by Oxana Lobysheva on 05/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import Foundation

class Question {
    
    var questionNumber: Int
    var question: String
    var answers: [String]
    var correctAnswer: Int
    
    init(questionNumber: Int, question: String, answers: [String], correctAnswer: Int) {
        self.questionNumber = questionNumber
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
    
    public func setQuestionNumber(_ num: Int){
        self.questionNumber = num
    }
}
