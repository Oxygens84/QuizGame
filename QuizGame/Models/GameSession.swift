//
//  GameSession.swift
//  QuizGame
//
//  Created by Oxana Lobysheva on 05/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//


class GameSession {
    
    var correctAnswers: Observable<Int>
    var currentQuestion: Observable<Int>
    var totalAnswers: Int
    var questions: Int
    var percentage: Int {
        get {
            if questions > 0 {
                return correctAnswers.value*100/questions
            }
            return 0
        }
    }
    
    init() {
        self.correctAnswers = Observable(0)
        self.currentQuestion = Observable(0)
        self.totalAnswers = 0
        self.questions = 0
    }

}

