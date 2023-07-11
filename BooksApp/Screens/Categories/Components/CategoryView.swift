//
//  CategoryView.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 11.07.2023.
//

import SwiftUI

struct CategoryView: View {
    let name: String
    let publishedDate: String
    let backgroundColor: Color
    private let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        VStack {
            Text(name)
                .foregroundColor(.black)
                .font(.system(size: 20))
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(publishedDate)
                .foregroundColor(.gray)
                .font(.system(size: 14))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: screenWidth - 50, height: 40, alignment: .leading)
        .padding()
        .background(backgroundColor)
        .cornerRadius(20)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(name: "", publishedDate: "", backgroundColor: .categoryBackground1)
    }
}

