//
//  MovieQuizView.swift
//  MovieQuizImp
//
//  Created by Aleksei Frolov on 19. 11. 2025..
//

import SwiftUI

struct MovieQuizView: View {
    
    private let questionTitle = "Question"
    private let questionNumber = "1/10"
    private let questionText = "Is the rating of this movie\nless than 5?"
    private let imageName = "Placeholder"
    
    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                MovieQuizHeaderView(
                    title: questionTitle,
                    number: questionNumber
                )
                
                MoviePosterView(imageName: imageName)
                
                Text(questionText)
                    .font(.ysDisplayBold23)
                    .foregroundColor(.appWhite)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                
                MovieQuizButtonsView(
                    onYesTap: { print("Yes tapped") },
                    onNoTap: { print("No tapped") }
                )
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .padding(.bottom, 0)
        }
    }
}
