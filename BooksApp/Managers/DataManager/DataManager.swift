//
//  BookManager.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 05.07.2023.
//

import Foundation
import Alamofire
import Combine

class DataManager: DataManagerProtocol {
    var error: Error?
    
    private let networkManager: NetworkManagerProtocol
    private let realmManager: RealmManagerProtocol
    private var cancellables: Set<AnyCancellable> = []
    
    init(networkManager: NetworkManagerProtocol, realmManager: RealmManagerProtocol) {
        self.networkManager = networkManager
        self.realmManager = realmManager
    }
    
    func getCategories(completion: @escaping ([Category]) -> Void) {
        if checkInternetConnectivity() {
            fetchAndSaveCategories { [weak self] in
                self?.realmManager.getCategories { categories in
                    completion(categories)
                }
            }
        } else {
            realmManager.getCategories { categories in
                completion(categories)
            }
        }
    }
    
    func getPublishedDate(completion: @escaping (String) -> Void) {
        if checkInternetConnectivity() {
            fetchAndSavePublishedDate { [weak self] in
                self?.realmManager.getPublishedDate { date in
                    completion(date)
                }
            }
        } else {
            realmManager.getPublishedDate { date in
                completion(date)
            }
        }
    }
}

private extension DataManager {
    func checkInternetConnectivity() -> Bool {
        let networkReachabilityManager = NetworkReachabilityManager()
        return networkReachabilityManager?.isReachable ?? false
    }
    
    func fetchResults() -> AnyPublisher<Results, Error> {
        return networkManager.fetchData(
            url: Constants.url
        )
        .eraseToAnyPublisher()
    }

    func fetchAndSaveCategories(completion: @escaping () -> Void) {
        fetchResults()
            .map { $0.results.categories }
            .sink { [weak self] sinkCompletion in
                if case let .failure(error) = sinkCompletion {
                    self?.error = error
                }
                completion()
            } receiveValue: { [weak self] categories in
                self?.realmManager.deleteAll()
                self?.realmManager.saveCategories(categories: categories)
                completion()
            }
            .store(in: &cancellables)
    }
    
    func fetchAndSavePublishedDate(completion: @escaping () -> Void) {
        fetchResults()
            .map { $0.results.publishedDate }
            .sink { [weak self] sinkCompletion in
                if case let .failure(error) = sinkCompletion {
                    self?.error = error
                }
                completion()
            } receiveValue: { [weak self] date in
                self?.realmManager.savePublishedDate(publishedDate: date)
                completion()
            }
            .store(in: &cancellables)
    }
}
