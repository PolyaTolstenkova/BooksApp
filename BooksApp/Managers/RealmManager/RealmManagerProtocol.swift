//
//  RealmManagerProtocol.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 10.07.2023.
//

import Foundation

protocol RealmManagerProtocol {
    func saveCategories(categories: [Category])
    func getCategories(completion: @escaping ([Category]) -> Void)
    func savePublishedDate(publishedDate: String)
    func getPublishedDate(completion: @escaping (String) -> Void)
    func deleteAll()
}
