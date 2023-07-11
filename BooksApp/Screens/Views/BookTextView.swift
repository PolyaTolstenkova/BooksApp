//
//  BookTextVIew.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 10.07.2023.
//

import SwiftUI

struct BookTextView: View {
    let text: String
    let color: Color
    let size: CGFloat
    
    var body: some View {
        Text(text)
            .font(.system(size: size))
            .foregroundColor(color)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 0.8)
    }
}

