//
//  BookView.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 05.07.2023.
//

import SwiftUI

struct BooksView: View {
    @ObservedObject var viewModel: BooksViewModel
    private let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        VStack {
            Text(viewModel.category.name)
                .font(.system(size: 20))
                .bold()
                .frame(maxWidth: screenWidth - 20, alignment: .topLeading)
            ScrollView {
                VStack {
                    ForEach(viewModel.getBooks(), id: \.id) { book in
                        BookView(book: book)
                        DividerView()
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView(viewModel: BooksViewModel(category: Category(name: "", books: [])))
    }
}
