//
//  SequentialQuestionsStrategy.swift
//  QuizGame
//
//  Created by Oxana Lobysheva on 11/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

final class SequentialQuestionsStrategy: SetQuestionsStrategy {

    func setQuestions(_ questions: [Question]) -> [Question] {
        return questions.sorted(by: { $0.questionNumber < $1.questionNumber })
    }
}
