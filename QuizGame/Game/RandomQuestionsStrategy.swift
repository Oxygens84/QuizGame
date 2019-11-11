//
//  RandomQuestionsStrategy.swift
//  QuizGame
//
//  Created by Oxana Lobysheva on 11/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

final class RandomQuestionsStrategy: SetQuestionsStrategy {
    
    func setQuestions(_ questions: [Question]) -> [Question] {
        for i in 0..<questions.count {
            questions[i].setQuestionNumber(Int.random(in: 0..<5000000))
        }
        return questions.sorted(by: { $0.questionNumber < $1.questionNumber })
    }
}
