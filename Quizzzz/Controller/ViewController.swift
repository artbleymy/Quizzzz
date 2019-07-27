//
//  ViewController.swift
//  Quizzzz
//
//  Created by Stanislav on 26/07/2019.
//  Copyright © 2019 Stanislav Kozlov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let questionBank = QuestionBank()
    
    var pickedAnswer : Bool = false
    var currentQuestionIndex : Int = 0
    var scorePoints : Int = 0
    var questionProgressCounter : Int = 0
    var numberOfQuestions : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    
    @IBOutlet weak var progressBarWidth: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numberOfQuestions = questionBank.list.count
        updateUI()
    }
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        pickedAnswer = (sender.tag == 1) ? true : false
        checkAnswer()
        
    }
    
    //update ui
    func updateUI(){
        questionLabel.text = questionBank.list[currentQuestionIndex].questionText
        scoreLabel.text = "\(scorePoints)"
        progressLabel.text = "\(currentQuestionIndex + 1) / \(numberOfQuestions)"
        
        progressBarWidth.constant = (view.frame.size.width / 13) * CGFloat(currentQuestionIndex + 1)
//        print("\(progressBarWidth)")
        //progressBar.frame.size.width = progressBarWidth.
        //print("\(progressBar.frame.size.width)")
        
    }
    //go to next question
    func nextQuestion(){
        
        currentQuestionIndex += 1
        if currentQuestionIndex < questionBank.list.count {
            updateUI()
        } else {
            //create alert controller
            let alert = UIAlertController(title: "Your score is \(scorePoints)",
                                          message: "Do you want to start again?",
                                          preferredStyle: .alert)
            let restartAction = UIAlertAction(title: NSLocalizedString("Restart", comment: "Default action"),
                                              style: .default,
                                              handler:{ (_) in
                                                self.startOver()
            })
            alert.addAction(restartAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    //start quizz again
    func startOver(){
        
        currentQuestionIndex = 0
        scorePoints = 0
        updateUI()
        
    }
    //check the answer
    func checkAnswer(){
        
        let correctAnswer = questionBank.list[currentQuestionIndex].answer
        if pickedAnswer == correctAnswer {
            scorePoints += 1
            ProgressHUD.showSuccess("Correct!")
        } else {
            ProgressHUD.showError("Fail!")
        }
        
        nextQuestion()
    }
    
    
    
}

