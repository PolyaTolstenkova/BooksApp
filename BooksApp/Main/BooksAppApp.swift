//
//  BooksAppApp.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 05.07.2023.
//

import SwiftUI

@main
struct BooksAppApp: App {
    var body: some Scene {
        WindowGroup {
            CategoriesView(
                viewModel: CategoriesViewModel(
                    dataManager: DataManager(
                        networkManager: NetworkManager(),
                        realmManager: RealmManager.shared
                    )
                )
            )
        }
    }
}
