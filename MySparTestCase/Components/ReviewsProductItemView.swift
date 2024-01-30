//
//  ReviewsProductItemView.swift
//  MySparTestCase
//
//  Created by Ruslan Magomedov on 30.01.2024.
//

import SwiftUI

struct ReviewsProductItemView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .shadow(color: .black.opacity(0.2), radius: 8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Александр В.")
                    .fontWeight(.bold)
                Text("7 мая 2021")
                    .font(.callout)
                    .foregroundColor(.gray)
                
                HStack(spacing: 3) {
                    ForEach(0..<5, id: \.self) { index in
                        Image(systemName: "star.fill")
                            .foregroundColor(index == 4 ? .gray.opacity(0.3) : .yellow)
                            .font(.subheadline)
                    }
                }
                
                Text("Хорошая добавка мне очень понравилось! Хочу чтобы все добавки были такими!")
                    .font(.footnote)
            }
            .padding()
        }
        .padding(.vertical)
        .frame(width: 240, height: 190)
    }
}

#Preview {
    ReviewsProductItemView()
}
