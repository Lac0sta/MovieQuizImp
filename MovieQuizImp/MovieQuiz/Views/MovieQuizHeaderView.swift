//
//  MovieQuizHeaderView.swift
//  MovieQuizImp
//
//  Created by Aleksei Frolov on 19. 11. 2025..
//

import SwiftUI

struct MovieQuizHeaderView: View {
    let title: String
    let number: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.ysDisplayMedium20)
                .foregroundColor(.appWhite)
            
            Spacer()
            
            Text(number)
                .font(.ysDisplayMedium20)
                .foregroundColor(.appWhite)
        }
    }
}
