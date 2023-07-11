//
//  ImageView.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 10.07.2023.
//

import SwiftUI

struct ImageView: View {
    let imageURL: URL?
    let height: CGFloat
    private let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        AsyncImage(url: imageURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenWidth / 2 - 50, height: height)
        } placeholder: {
            Image.placeholder
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenWidth / 2 - 50, height: height)
        }
    }
}
