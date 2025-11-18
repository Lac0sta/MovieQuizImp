//
//  MovieQuizPrimaryButtonStyle.swift
//  MovieQuizImp
//
//  Created by Aleksei Frolov on 19. 11. 2025..
//

import SwiftUI

struct MovieQuizPrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.ysDisplayMedium20)
            .foregroundColor(.appBlack)
            .frame(maxWidth: .infinity, minHeight: 60)
            .background(Color.appWhite)
            .cornerRadius(15)
        
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}
