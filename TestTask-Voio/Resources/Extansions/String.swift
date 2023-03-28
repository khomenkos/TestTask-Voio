//
//  String.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
    
    func yearMonthDayString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
}
