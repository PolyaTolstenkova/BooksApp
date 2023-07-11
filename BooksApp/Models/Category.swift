//
//  Category.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 09.07.2023.
//

import Foundation
import RealmSwift

struct Category: Codable {
    let id: UUID = UUID()
    let name: String
    let books: [Book]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "display_name"
        case books
    }
}

extension Category: DomainModelConvertible {
    func toDomainModel() -> CategoryObject {
        let categoryObject = CategoryObject()
        let bookObjects = List<BookObject>()
        for book in books {
            bookObjects.append(
                book.toDomainModel()
            )
        }
        categoryObject.name = name
        categoryObject.books = bookObjects
        return categoryObject
    }
}
