//
//  BuyLinkObject.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 09.07.2023.
//

import Foundation
import RealmSwift

class BuyLinkObject: Object {
    @Persisted var name = String()
    @Persisted var url = String()
}

extension BuyLinkObject: DomainModelConvertible {
    func toDomainModel() -> BuyLink {
        return BuyLink(name: name, url: url)
    }
}
