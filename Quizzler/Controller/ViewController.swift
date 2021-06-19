//
//  ViewController.swift
//  Quizzler
//
//  Created by Alexey on 6/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var choise1: UIButton!
    @IBOutlet weak var choise2: UIButton!
    @IBOutlet weak var choise3: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // True or False
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        let answerChoise = quizBrain.getAnswers()
        choise1.setTitle(answerChoise[0], for: .normal)
        choise2.setTitle(answerChoise[1], for: .normal)
        choise3.setTitle(answerChoise[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        choise1.backgroundColor = UIColor.clear
        choise2.backgroundColor = UIColor.clear
        choise3.backgroundColor = UIColor.clear
    }
}


