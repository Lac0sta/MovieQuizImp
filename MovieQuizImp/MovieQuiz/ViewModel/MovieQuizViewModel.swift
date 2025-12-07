//
//  MovieQuizViewModel.swift
//  MovieQuizImp
//
//  Created by Aleksei Frolov on 24. 11. 2025..
//

import SwiftUI
import Combine

@MainActor
final class MovieQuizViewModel: ObservableObject {
    
    @Published private(set) var currentQuestionIndex: Int = 0
    @Published private(set) var currentQuestion: QuizQuestion
    @Published private(set) var currentStep: QuizStepViewData
    @Published private(set) var answerState: AnswerState = .neutral
    @Published private(set) var correctAnswersCount: Int = 0
    @Published private(set) var areButtonsEnabled: Bool = true
    @Published var isShowingResults: Bool = false
    @Published var resultsMessage: String = ""
    
    var questionNumber: String { "\(currentQuestionIndex + 1)/\(Constants.questionsAmount)" }
    var questionText: String { currentQuestion.text }
    
    private let questionGenerator: QuestionGeneratorProtocol = QuestionGenerator()
    
    init() {
        guard let firstQuestion = questionGenerator.requestNextQuestion() else {
            fatalError("QuestionGenerator returned no questions on first request")
        }
        
        self.currentQuestion = firstQuestion
        self.currentStep = QuizStepViewData(
            imageName: firstQuestion.image,
            question: firstQuestion.text,
            questionNumber: "1/\(Constants.questionsAmount)"
        )
    }
    
    func yesButtonTapped() {
        handleAnswer(givenAnswer: true)
    }
    
    func noButtonTapped() {
        handleAnswer(givenAnswer: false)
    }
    
    func restartQuiz() {
        currentQuestionIndex = 0
        correctAnswersCount = 0
        
        if let firstQuestion = questionGenerator.requestNextQuestion() {
            currentQuestion = firstQuestion
            
            currentStep = QuizStepViewData(
                imageName: firstQuestion.image,
                question: firstQuestion.text,
                questionNumber: "1/\(Constants.questionsAmount)"
            )
        }
        
        answerState = .neutral
        isShowingResults = false
        resultsMessage = ""
        areButtonsEnabled = true
    }
    
    private func handleAnswer(givenAnswer: Bool) {
        guard areButtonsEnabled else { return }
        areButtonsEnabled = false
        
        let correctAnswer = currentQuestion.correctAnswer
        let isCorrect = (givenAnswer == correctAnswer)
        
        if isCorrect {
            correctAnswersCount += 1
            answerState = .correct
        } else {
            answerState = .wrong
        }
        
        waitForNextQuestion()
    }
    
    private func convert(question: QuizQuestion) -> QuizStepViewData {
        return QuizStepViewData(
            imageName: question.image,
            question: question.text,
            questionNumber: questionNumber
        )
    }
    
    private func show(question: QuizQuestion) {
        currentQuestion = question
        currentStep = convert(question: question)
        answerState = .neutral
        areButtonsEnabled = true
    }
    
    private func showNextQuestionOrResult() {
        let isLastQuestion = currentQuestionIndex == (Constants.questionsAmount - 1)
        
        if isLastQuestion {
            resultsMessage = "\(L10n.quizResultText): \(correctAnswersCount)/\(Constants.questionsAmount)"
            isShowingResults = true
        } else {
            currentQuestionIndex += 1
            
            if let nextQuestion = questionGenerator.requestNextQuestion() {
                currentQuestion = nextQuestion
                show(question: nextQuestion)
            }
        }
    }
    
    private func waitForNextQuestion() {
        Task { @MainActor in
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            showNextQuestionOrResult()
        }
    }
}
