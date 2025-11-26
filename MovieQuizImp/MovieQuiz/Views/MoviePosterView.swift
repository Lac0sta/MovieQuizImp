//
//  MoviePosterView.swift
//  MovieQuizImp
//
//  Created by Aleksei Frolov on 18. 11. 2025..
//

import SwiftUI

struct MoviePosterView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName.isEmpty ? "Placeholder" : imageName)
            .resizable()
            .frame(maxWidth: .infinity)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.appWhite, lineWidth: 8)
            )
    }
}
