//
//  CategoryObject.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 09.07.2023.
//

import Foundation
import RealmSwift

class CategoryObject: Object {
    @Persisted var id = 0
    @Persisted var name = String()
    @Persisted var books = List<BookObject>()
}

extension CategoryObject: DomainModelConvertible {
    func toDomainModel() -> Category {
        var domainBooks: [Book] = []
        for book in books {
            domainBooks.append(
                book.toDomainModel()
            )
        }
        return Category(name: name, books: domainBooks)
    }
}
