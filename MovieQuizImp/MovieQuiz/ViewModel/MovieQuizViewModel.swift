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
    
    var questionNumber: String { "\(currentQuestionIndex + 1)/\(questions.count)" }
    var questionText: String { currentQuestion.text }
    
    private let questions: [QuizQuestion] = [
        QuizQuestion(
            image: "The Godfather",
            text: L10n.quizQuestionText,
            correctAnswer: true),
        QuizQuestion(
            image: "The Dark Knight",
            text: L10n.quizQuestionText,
            correctAnswer: true),
        QuizQuestion(
            image: "Kill Bill",
            text: L10n.quizQuestionText,
            correctAnswer: true),
        QuizQuestion(
            image: "The Avengers",
            text: L10n.quizQuestionText,
            correctAnswer: true),
        QuizQuestion(
            image: "Deadpool",
            text: L10n.quizQuestionText,
            correctAnswer: true),
        QuizQuestion(
            image: "The Green Knight",
            text: L10n.quizQuestionText,
            correctAnswer: true),
        QuizQuestion(
            image: "Old",
            text: L10n.quizQuestionText,
            correctAnswer: false),
        QuizQuestion(
            image: "The Ice Age Adventures of Buck Wild",
            text: L10n.quizQuestionText,
            correctAnswer: false),
        QuizQuestion(
            image: "Tesla",
            text: L10n.quizQuestionText,
            correctAnswer: false),
        QuizQuestion(
            image: "Vivarium",
            text: L10n.quizQuestionText,
            correctAnswer: false)
    ]
    
    init() {
        let firstQuestion = questions[0]
        self.currentQuestion = firstQuestion
        
        self.currentStep = QuizStepViewData(
            imageName: firstQuestion.image,
            question: firstQuestion.text,
            questionNumber: "1/\(questions.count)"
        )
    }
    
    func yesButtonTapped() {
        handleAnswer(givenAnswer: true)
    }
    
    func noButtonTapped() {
        handleAnswer(givenAnswer: false)
    }
    
    private func handleAnswer(givenAnswer: Bool) {
        let correctAnswer = currentQuestion.correctAnswer
        let isCorrect = (givenAnswer == correctAnswer)
        
        answerState = isCorrect ? .correct : .wrong
        
        waitForNextQuestion()
    }
    
    private func convert(question: QuizQuestion) -> QuizStepViewData {
        return QuizStepViewData(
            imageName: question.image,
            question: question.text,
            questionNumber: questionNumber
        )
    }
    
    private func show(questionAt index: Int) {
        currentQuestionIndex = index
        let question = questions[index]
        currentQuestion = question
        currentStep = convert(question: question)
        answerState = .neutral
    }
    
    private func showNextQuestionOrResult() {
        let isLastQuestion = currentQuestionIndex == (questions.count - 1)
        
        if isLastQuestion {
            // TO DO: result message
            restartQuiz()
        } else {
            let nextIndex = currentQuestionIndex + 1
            show(questionAt: nextIndex)
        }
    }
    
    private func waitForNextQuestion() {
        Task { @MainActor in
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            showNextQuestionOrResult()
        }
    }
    
    private func restartQuiz() {
        currentQuestionIndex = 0
        let firstQuestion = questions[0]
        currentQuestion = firstQuestion
        
        currentStep = QuizStepViewData(
            imageName: firstQuestion.image,
            question: firstQuestion.text,
            questionNumber: "1/\(questions.count)"
        )
        
        answerState = .neutral
    }
}
