//
//  DataManagerProtocol.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 10.07.2023.
//

import Foundation

protocol DataManagerProtocol {
    var error: Error? { get set }
    func getCategories(completion: @escaping ([Category]) -> Void)
    func getPublishedDate(completion: @escaping (String) -> Void)
}
