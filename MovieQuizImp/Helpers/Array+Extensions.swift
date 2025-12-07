//
//  Array+Extensions.swift
//  MovieQuizImp
//
//  Created by Aleksei Frolov on 7. 12. 2025..
//

import Foundation

extension Array {
    subscript (safe index: Index) -> Element? {
        indices ~= index ? self[index] : nil
    }
}
