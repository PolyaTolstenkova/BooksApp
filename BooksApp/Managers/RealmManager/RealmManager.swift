//
//  RealmManager.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 09.07.2023.
//

import Foundation
import RealmSwift

class RealmManager: RealmManagerProtocol {
    static var shared = RealmManager()
    private var realm: Realm!
    
    private init() {
        self.realm = try! Realm()
    }
    
    func saveCategories(categories: [Category]) {
        let categoryObjects = List<CategoryObject>()
        for category in categories {
            try! self.realm.write {
                categoryObjects.append(category.toDomainModel())
            }
        }
        try! self.realm.write {
            self.realm.add(categoryObjects)
        }
    }
    
    func getCategories(completion: @escaping ([Category]) -> Void) {
        var categories: [Category] = []
        let categoryObjects = realm.objects(CategoryObject.self)
        
        for categoryObject in categoryObjects {
            categories.append(
                categoryObject.toDomainModel()
            )
        }
        completion(categories)
    }
    
    func savePublishedDate(publishedDate: String) {
        let object = PublishedDateObject()
        object.date = publishedDate
        
        try! self.realm.write {
            self.realm.add(object)
        }
    }
    
    func getPublishedDate(completion: @escaping (String) -> Void) {
        let object = realm.objects(PublishedDateObject.self).first
        completion(object?.date ?? String())
    }
    
    func deleteAll() {
        try! self.realm.write {
            self.realm.deleteAll()
        }
    }
}
