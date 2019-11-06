//
//  Question.swift
//  QuizGame
//
//  Created by Oxana Lobysheva on 05/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import Foundation

struct Question {
    
    var question: String
    var answers: [String]
    var correctAnswer: Int
    
    init(question: String, answers: [String], correctAnswer: Int) {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}
