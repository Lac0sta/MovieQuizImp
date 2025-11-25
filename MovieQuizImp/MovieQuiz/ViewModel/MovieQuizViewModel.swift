//
//  MovieQuizViewModel.swift
//  MovieQuizImp
//
//  Created by Aleksei Frolov on 24. 11. 2025..
//

import SwiftUI
import Combine

final class MovieQuizViewModel: ObservableObject {
    
    @Published private(set) var currentQuestionIndex: Int = 0
    @Published private(set) var currentQuestion: QuizQuestion
    
    var questionNumber: String { "\(currentQuestionIndex + 1)/\(questions.count)" }
    var questionText: String { currentQuestion.text }
    var currentImage: String { currentQuestion.image.isEmpty ? "Placeholder" : currentQuestion.image }
    
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
        self.currentQuestion = questions[0]
    }
}
