//
//  QuestionGenerator.swift
//  MovieQuizImp
//
//  Created by Aleksei Frolov on 7. 12. 2025..
//

import Foundation

final class QuestionGenerator: QuestionGeneratorProtocol {
    
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
    
    func requestNextQuestion() -> QuizQuestion? {
        guard let index = (0..<questions.count).randomElement() else {
            return nil
        }
        
        return questions[safe: index]
    }
}
