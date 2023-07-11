//
//  NetworkManager.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 05.07.2023.
//

import Foundation
import Alamofire
import Combine

class NetworkManager: NetworkManagerProtocol {
    func fetchData<T: Decodable>(url: String) -> AnyPublisher<T, Error> {
        return Future<T, Error> { promise in
            AF.request(url, parameters: nil, headers: nil)
                .validate(statusCode: 200 ..< 300)
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let result):
                        promise(.success(result))
                    case .failure(let error):
                        promise(.failure(error))
                    }
                }
        }
        .eraseToAnyPublisher()
    }
}
