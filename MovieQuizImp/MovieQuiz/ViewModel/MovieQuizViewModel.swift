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
    
    var questionTitle: String { "Question" }
    var questionNumber: String { "\(currentQuestionIndex + 1)/\(questions.count)" }
    var questionText: String { currentQuestion.text }
    var currentImage: String { currentQuestion.image.isEmpty ? "Placeholder" : currentQuestion.image }
    
    private let questions: [QuizQuestion] = [
        QuizQuestion(
            image: "The Godfather",
            text: "Is the rating of this movie greater than 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Dark Knight",
            text: "Is the rating of this movie greater than 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Kill Bill",
            text: "Is the rating of this movie greater than 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Avengers",
            text: "Is the rating of this movie greater than 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Deadpool",
            text: "Is the rating of this movie greater than 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Green Knight",
            text: "Is the rating of this movie greater than 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Old",
            text: "Is the rating of this movie greater than 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "The Ice Age Adventures of Buck Wild",
            text: "Is the rating of this movie greater than 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "Tesla",
            text: "Is the rating of this movie greater than 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "Vivarium",
            text: "Is the rating of this movie greater than 6?",
            correctAnswer: false)
    ]
    
    init() {
        self.currentQuestion = questions[0]
    }
}
