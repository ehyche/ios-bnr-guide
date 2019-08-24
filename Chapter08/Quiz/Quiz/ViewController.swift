//
//  ViewController.swift
//  Quiz
//
//  Created by Eric Hyche on 6/15/19.
//  Copyright © 2019 Eric Hyche. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!


    let questions: [String] = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is cognac made from?"
    ]
    let answers: [String] = [
        "14",
        "Montpelier",
        "Grapes"
    ]
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        questionLabel.text = questions[currentQuestionIndex]
        currentQuestionLabel.text = questions[currentQuestionIndex]
        
        updateOffscreenLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set the label's initial alpha
//        questionLabel.alpha = 0
        nextQuestionLabel.alpha = 0
    }
    

    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
//        questionLabel.text = question
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    func animateLabelTransitions() {
        
        view.layoutIfNeeded()
        
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = 0
        currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5,
                                                       delay: 0.0,
                                                       options: [.curveLinear],
                                                       animations: {
//                                                        self.questionLabel.alpha = 1.0
                                                        self.currentQuestionLabel.alpha = 0
                                                        self.nextQuestionLabel.alpha = 1

                                                        self.view.layoutIfNeeded()
                                                       },
                                                       completion: { _ in
                                                            swap(&self.currentQuestionLabel,
                                                                 &self.nextQuestionLabel)
                                                            swap(&self.currentQuestionLabelCenterXConstraint,
                                                                 &self.nextQuestionLabelCenterXConstraint)
                                                        
                                                            self.updateOffscreenLabel()
                                                       })
    }
    
    func updateOffscreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
}

