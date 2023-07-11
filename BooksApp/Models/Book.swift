//
//  Book.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 09.07.2023.
//

import Foundation
import RealmSwift

struct Book: Codable {
    
    let id: UUID = UUID()
    let title: String
    let author: String
    let image: String
    let overview: String
    let publisher: String
    let rank: Int
    let buyLinks: [BuyLink]
    
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case image = "book_image"
        case overview = "description"
        case publisher
        case rank
        case buyLinks = "buy_links"
    }
}

extension Book: DomainModelConvertible {
    func toDomainModel() -> BookObject {
        let bookObject = BookObject()
        let buyLinkObjects = List<BuyLinkObject>()
        for buyLink in buyLinks {
            buyLinkObjects.append(
                buyLink.toDomainModel()
            )
        }
        bookObject.title = title
        bookObject.author = author
        bookObject.image = image
        bookObject.overview = overview
        bookObject.publisher = publisher
        bookObject.rank = rank
        bookObject.buyLinks = buyLinkObjects
        return bookObject
    }
}

extension Book {
    var imageURL: URL? {
        URL(string: image)
    }
}
