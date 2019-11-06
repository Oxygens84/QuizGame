//
//  QuestionViewController.swift
//  QuizGame
//
//  Created by Oxana Lobysheva on 05/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import UIKit
import WebKit

class QuestionViewController: UIViewController {

    let questions: [Question] =
        [
          Question(
            question: "Как правильно продолжить припев детской песни: \"Тили-тили...\"?",
            answers: ["хали-гали","трали-вали","жили-были","ели-пили"],
            correctAnswer: 1),
          Question(
            question: "Как называется экзотическое животное из Южной Америки?",
            answers: ["пчеложор","термитоглот","муравьед","комаролов"],
            correctAnswer: 2),
          Question(
            question: "Какой фильм сделал знаменитой песню в исполнении Уитни Хьюстон?",
            answers: ["Телохранитель","Красотка","Форрест Гамп","Пятый элемент"],
            correctAnswer: 0),
          Question(
            question: "Какой писатель сформулировал Три закона робототехники?",
            answers: ["Карел Чапек","Айзек Азимов","Станислав Лем","Курт Воннегут"],
            correctAnswer: 1),
          Question(
            question: "Возле какой горы впервые был найден драгоценный камень танзанит?",
            answers: ["Элбрус","Мак-Кинли","Аконкагуа","Килиманджаро"],
            correctAnswer: 3)
        ]
    
    var currentQuestion: Int = 0
    var currentCorrectAnswer: Int = -1
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!

    @IBAction func answerOnClick1(_ sender: UIButton) {
        validateAnswer(button: sender)
    }
    @IBAction func answerOnClick2(_ sender: UIButton) {
        validateAnswer(button: sender)
    }
    @IBAction func answerOnClick3(_ sender: UIButton) {
        validateAnswer(button: sender)
    }
    @IBAction func answerOnClick4(_ sender: UIButton) {
        validateAnswer(button: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Game.shared.game = GameSession()
        Game.shared.game?.questions = questions.count
        setValues()
    }
    
    func setValues(){
        if currentQuestion < questions.count {
            questionLabel.text = questions[currentQuestion].question
            answer1.setTitle(questions[currentQuestion].answers[0], for: .normal)
            answer2.setTitle(questions[currentQuestion].answers[1], for: .normal)
            answer3.setTitle(questions[currentQuestion].answers[2], for: .normal)
            answer4.setTitle(questions[currentQuestion].answers[3], for: .normal)
            currentCorrectAnswer = questions[currentQuestion].correctAnswer
        }
    }
    
    func performAlert(_ title: String, _ message: String){
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(title: ButtonTitles.ok.rawValue, style: UIAlertAction.Style.default) {
            UIAlertAction in
            let record = Record(date: Date(), score: Game.shared.game!.percentage)
            Game.shared.addRecord(record)
            Game.shared.game = nil
            self.navigationController?.popToRootViewController(animated: true)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func validateAnswer(button: UIButton){
        Game.shared.game?.totalAnswers += 1
        if currentCorrectAnswer == button.tag {
            Game.shared.game?.correctAnswers += 1
            if currentQuestion < questions.count {
                currentQuestion += 1
                setValues()
            }
            if currentQuestion == questions.count {
                performAlert(
                    Titles.congratulation.rawValue,
                    Messages.userWinner.rawValue)
            }
        } else {
            button.backgroundColor = UIColor.red
            performAlert(
                Titles.sorry.rawValue,
                Messages.userLoser.rawValue)
        }
    }

}
