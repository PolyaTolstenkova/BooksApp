//
//  BookObject.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 09.07.2023.
//

import Foundation
import RealmSwift

class BookObject: Object {
    @Persisted var title = String()
    @Persisted var author = String()
    @Persisted var image = String()
    @Persisted var overview = String()
    @Persisted var publisher = String()
    @Persisted var rank = 0
    @Persisted var buyLinks = List<BuyLinkObject>()
}

extension BookObject: DomainModelConvertible {
    func toDomainModel() -> Book {
        var domainBuyLinks: [BuyLink] = []
        for link in buyLinks {
            domainBuyLinks.append(link.toDomainModel())
        }
        return Book(
            title: title,
            author: author,
            image: image,
            overview: overview,
            publisher: publisher,
            rank: rank,
            buyLinks: domainBuyLinks
        )
    }
}
