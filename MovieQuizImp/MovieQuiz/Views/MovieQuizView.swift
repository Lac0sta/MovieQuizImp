//
//  MovieQuizView.swift
//  MovieQuizImp
//
//  Created by Aleksei Frolov on 19. 11. 2025..
//

import SwiftUI

struct MovieQuizView: View {
    
    @StateObject private var viewModel = MovieQuizViewModel()
    
    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                MovieQuizHeaderView(
                    title: "\(L10n.quizHeaderTitle):",
                    number: viewModel.currentStep.questionNumber
                )
                
                MoviePosterView(imageName: viewModel.currentStep.imageName)
                
                Text(viewModel.questionText)
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
