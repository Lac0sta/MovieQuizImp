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
            Button("No", action: onNoTap)
                .buttonStyle(MovieQuizPrimaryButtonStyle())
            
            Button("Yes", action: onYesTap)
                .buttonStyle(MovieQuizPrimaryButtonStyle())
        }
    }
}
