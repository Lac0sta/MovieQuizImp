//
//  MovieQuizView.swift
//  MovieQuizImp
//
//  Created by Aleksei Frolov on 19. 11. 2025..
//

import SwiftUI

struct MovieQuizView: View {
    
    @StateObject private var viewModel = MovieQuizViewModel()
    
    private var borderColor: Color {
        switch viewModel.answerState {
        case .neutral:
            return .clear
        case .correct:
            return .appGreen
        case .wrong:
            return .appRed
        }
    }
    
    var body: some View {
        ZStack {
            Color.appBlack
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                MovieQuizHeaderView(
                    title: "\(L10n.quizHeaderTitle):",
                    number: viewModel.currentStep.questionNumber
                )
                
                MoviePosterView(imageName: viewModel.currentStep.imageName)
                    .overlay(
                        Group {
                            if viewModel.answerState != .neutral {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(borderColor, lineWidth: 8)
                            }
                        }
                    )
                
                Text(viewModel.questionText)
                    .font(.ysDisplayBold23)
                    .foregroundColor(.appWhite)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                
                MovieQuizButtonsView(
                    onYesTap: { viewModel.yesButtonTapped() },
                    onNoTap: { viewModel.noButtonTapped() }
                )
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .padding(.bottom, 0)
        }
    }
}
