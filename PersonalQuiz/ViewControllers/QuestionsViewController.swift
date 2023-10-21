//
//  QuestionsViewController.swift
//  PersonalQuiz
//
//  Created by Egor Ukolov on 08.10.2023.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var questationLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwithes: [UISwitch]!
    
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedSlider: UISlider!
    @IBOutlet var rangedLabels: [UILabel]!
    
    @IBOutlet var questationProgresView: UIProgressView!
    
    // MARK: - Private properties
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answers: [Answer] {
        questions[questionIndex].answers
    }
    private var answersChoosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateIU()
    }
    
    // MARK: - IB Actions
    @IBAction func singleButtonAnswerPresed(_ sender: UIButton) {
        guard let currentIndexButton = singleButtons.firstIndex(of: sender) else { return }
        
        let currentAnswer = answers[currentIndexButton]
        answersChoosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleButtonAnswerPressed() {
        
        for (multipleSwitch, answer) in zip(multipleSwithes, answers) {
            if multipleSwitch.isOn {
                answersChoosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedButtonAnswerPressed() {
        let index = lroundf(rangedSlider.value * Float(answers.count - 1))
        
        let currentAnswer = answers[index]
        answersChoosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    // Проверяем выгрузку VC
    
    deinit {
        print("QuestionsViewController has been dealocated")
    }

}

// MARK: - Private Methods

extension QuestionsViewController {
    
    private func updateIU() {
        // hide everything
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        // Get current question
        let currentQuestion = questions[questionIndex]
        
        // Set current question for questationLabel
        questationLabel.text = currentQuestion.text
        
        // Calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // Set progress for questationProgresView
        questationProgresView.setProgress(totalProgress, animated: true)
        
        // Set navigation title
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        //
        showCurrentAnswers(for: currentQuestion.type)
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single: showSingleStackView(with: answers)
        case .multiple: showMultipleStackView(with: answers)
        case .ranged: showRangedStackView(with: answers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func showRangedStackView(with answers: [Answer]) {
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    
}

//MARK: - Navigation

extension QuestionsViewController {
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateIU()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    
    // prepare for Segue
    
    
}
