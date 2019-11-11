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

    private var setStrategy: SetQuestionsStrategy {
        switch Game.shared.gameStrategy {
        case .normal:
            return SequentialQuestionsStrategy()
        case .random:
            return RandomQuestionsStrategy()
        }
    }
    
    private var gameQuestions: GameQuestions?
    private let observer = Observer()
    
    private var questions: [Question] = []
    private var currentQuestion: Int = 0
    private var currentCorrectAnswer: Int = -1
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var gameInfo: UILabel!
    
    @IBOutlet weak var questionNum: UILabel!
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
        setStrategyForGame()
        Game.shared.game = GameSession()
        Game.shared.game?.questions = questions.count
        setValues()
        setGameInfo()
    }
    
    func setValues(){
        if currentQuestion < questions.count {
            questionLabel.text = questions[currentQuestion].question
            answer1.setTitle(questions[currentQuestion].answers[0], for: .normal)
            answer2.setTitle(questions[currentQuestion].answers[1], for: .normal)
            answer3.setTitle(questions[currentQuestion].answers[2], for: .normal)
            answer4.setTitle(questions[currentQuestion].answers[3], for: .normal)
            currentCorrectAnswer = questions[currentQuestion].correctAnswer
            Game.shared.game?.currentQuestion.value += 1
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
            Game.shared.game?.correctAnswers.value += 1
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
    
    func setStrategyForGame(){
        questions = self.setStrategy.setQuestions(GameQuestions().get())
    }

    func setGameInfo(){
        Game.shared.game?.currentQuestion.addObserver(observer, options: [.initial, .new, .old]) { info, change in
            self.questionNum.text = String("Current question: \(info)")
            
        }
        Game.shared.game?.correctAnswers.addObserver(observer, options: [.initial, .new, .old]) { info, change in
            self.gameInfo.text = String("Correct questions: \(Game.shared.game!.percentage) %")
        }
    }
}
