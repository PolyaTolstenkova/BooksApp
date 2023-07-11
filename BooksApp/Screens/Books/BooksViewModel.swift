//
//  BookViewModel.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 05.07.2023.
//

import Foundation

class BooksViewModel: ObservableObject {
    @Published var category: Category
    
    init(category: Category) {
        self.category = category
    }
    
    func getBooks() -> [Book] {
        return category.books
    }
}
