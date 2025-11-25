//
//  MovieQuizButtonsView.swift
//  MovieQuizImp
//
//  Created by Aleksei Frolov on 18. 11. 2025..
//

import SwiftUI

struct MovieQuizButtonsView: View {
    let onYesTap: () -> Void
    let onNoTap: () -> Void
    
    var body: some View {
        HStack(spacing: 20) {
            Button(L10n.quizButtonNo, action: onNoTap)
                .buttonStyle(MovieQuizPrimaryButtonStyle())
            
            Button(L10n.quizButtonYes, action: onYesTap)
                .buttonStyle(MovieQuizPrimaryButtonStyle())
        }
    }
}
