//
//  BookView.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 07.07.2023.
//

import SwiftUI

struct BookView: View {
    let book: Book
    private let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        HStack {
            ImageView(imageURL: book.imageURL, height: 150)
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.system(size: 18))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                BookTextView(
                    text: "\("book_by".localized) \(book.author)",
                    color: .bookText,
                    size: 14
                )
                BookTextView(
                    text: "\("book_rank".localized) \(book.rank)",
                    color: .bookGrayText,
                    size: 14
                )
                BookTextView(
                    text: "\("book_publisher".localized) \(book.publisher)",
                    color: .bookGrayText,
                    size: 14
                )

                NavigationLink(destination: DetailsView(book: book)) {
                    Text("book_details".localized)
                        .frame(width: 110, height: 38)
                        .foregroundColor(.bookText)
                        .border(Color.buttonBackground, width: 1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(maxWidth: screenWidth - 20, maxHeight: 180, alignment: .leading)
        .padding(5)
    }
}
