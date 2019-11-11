//
//  SetQuestionsStrategy.swift
//  QuizGame
//
//  Created by Oxana Lobysheva on 11/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

protocol SetQuestionsStrategy {
    
     func setQuestions(_ questions: [Question]) -> [Question]
    
}
