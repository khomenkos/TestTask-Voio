//
//  ApiResponse.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let resultCount: Int?
    let results: T?
}
