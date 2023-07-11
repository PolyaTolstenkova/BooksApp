//
//  String.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 10.07.2023.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    func convertDateFormat() -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "d MMM yyyy"

        if let date = inputFormatter.date(from: self) {
            let formattedDate = outputFormatter.string(from: date)
            return formattedDate
        }
        
        return String()
    }
}
