//
//  CategoriesViewModel.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 05.07.2023.
//

import Foundation
import Combine
import SwiftUI

class CategoriesViewModel: ObservableObject {
    
    @Published var isLoading: Bool = true
    @Published var categories: [Category] = []
    @Published var publishedDate: String = String()
    @Published var error: Error?
    @Published var showErrorAlert: Bool = false
    
    private let dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
        self.getCategories()
        self.getPublishedDate()
        self.handleError()
    }
    
    func getCategories() {
        dataManager.getCategories { [weak self] categories in
            self?.categories = categories
            self?.isLoading = false
        }
    }
    
    func getPublishedDate() {
        dataManager.getPublishedDate { [weak self] date in
            self?.publishedDate = date
        }
    }
    
    func handleError() {
        error = dataManager.error
        if error != nil {
            showErrorAlert = true
        }
    }
    
    func getIndex(of category: Category) -> Int {
        return categories.firstIndex(where: { $0.id == category.id }) ?? 0
    }
}
