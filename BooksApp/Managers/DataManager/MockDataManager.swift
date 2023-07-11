//
//  MockDataManager.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 10.07.2023.
//

import Foundation

class MockDataManager: DataManagerProtocol {
    
    var error: Error?
    
    func getCategories(completion: @escaping ([Category]) -> Void) {
        completion([])
    }
    
    func getPublishedDate(completion: @escaping (String) -> Void) {
        completion(String())
    }
}
