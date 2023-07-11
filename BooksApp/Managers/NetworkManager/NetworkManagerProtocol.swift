//
//  NetworkManagerProtocol.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 10.07.2023.
//

import Foundation
import Combine

protocol NetworkManagerProtocol {
    func fetchData<T: Decodable>(url: String) -> AnyPublisher<T, Error>
}
