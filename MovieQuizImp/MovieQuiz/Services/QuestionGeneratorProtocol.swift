//
//  QuestionGeneratorProtocol.swift
//  MovieQuizImp
//
//  Created by Aleksei Frolov on 7. 12. 2025..
//

import Foundation

protocol QuestionGeneratorProtocol {
    func requestNextQuestion() -> QuizQuestion?
}
