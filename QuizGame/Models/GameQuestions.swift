//
//  GameQuestions.swift
//  QuizGame
//
//  Created by Oxana Lobysheva on 11/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import Foundation

class GameQuestions {
    
    private var questions: [Question] = []
    
    var question1 = Question(
        questionNumber: 1,
        question: "Как правильно продолжить припев детской песни: \"Тили-тили...\"?",
        answers: ["хали-гали","трали-вали","жили-были","ели-пили"],
        correctAnswer: 1)
    
    var question2 = Question(
        questionNumber: 2,
        question: "Как называется экзотическое животное из Южной Америки?",
        answers: ["пчеложор","термитоглот","муравьед","комаролов"],
        correctAnswer: 2)
    
    var question3 = Question(
        questionNumber: 3,
        question: "Какой фильм сделал знаменитой песню в исполнении Уитни Хьюстон?",
        answers: ["Телохранитель","Красотка","Форрест Гамп","Пятый элемент"],
        correctAnswer: 0)
    
    var question4 = Question(
        questionNumber: 4,
        question: "Какой писатель сформулировал Три закона робототехники?",
        answers: ["Карел Чапек","Айзек Азимов","Станислав Лем","Курт Воннегут"],
        correctAnswer: 1)
    
    var question5 = Question(
        questionNumber: 5,
        question: "Возле какой горы впервые был найден драгоценный камень танзанит?",
        answers: ["Элбрус","Мак-Кинли","Аконкагуа","Килиманджаро"],
        correctAnswer: 3)
    
    init(){
        self.questions = [question1, question2, question3, question4, question5]
    }
    
    public func get() -> [Question]{
        return self.questions
    }
}
