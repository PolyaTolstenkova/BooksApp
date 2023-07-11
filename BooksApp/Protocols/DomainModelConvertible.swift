//
//  DomainModelConverible.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 09.07.2023.
//

import Foundation

protocol DomainModelConvertible {
    associatedtype DomainModelType
    func toDomainModel() -> DomainModelType
}
