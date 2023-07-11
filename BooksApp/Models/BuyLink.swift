//
//  BuyLink.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 09.07.2023.
//

import Foundation
import RealmSwift

struct BuyLink: Codable {
    let name: String
    let url: String
}

extension BuyLink: DomainModelConvertible {
    func toDomainModel() -> BuyLinkObject {
        let buyLinkObject = BuyLinkObject()
        buyLinkObject.name = name
        buyLinkObject.url = url
        return buyLinkObject
    }
}
