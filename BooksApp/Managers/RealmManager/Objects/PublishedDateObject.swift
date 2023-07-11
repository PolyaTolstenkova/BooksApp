//
//  PublishedDateObject.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 09.07.2023.
//

import Foundation
import RealmSwift

class PublishedDateObject: Object {
    @Persisted var date = String()
}
