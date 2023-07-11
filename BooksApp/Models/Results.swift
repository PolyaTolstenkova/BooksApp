//
//  CategoryModel.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 05.07.2023.
//

import Foundation
import RealmSwift

struct Results: Codable {
    let results: BookResult
}

struct BookResult: Codable {
    let publishedDate: String
    let categories: [Category]
    
    enum CodingKeys: String, CodingKey {
        case publishedDate = "published_date"
        case categories = "lists"
    }
}
