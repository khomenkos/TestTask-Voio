//
//  AppError.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    case emptyResult(Int)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "I have no idea what go on"
        case .invalidUrl:
            return "Give me a valid URL"
        case .serverError(let error):
            return error
        case .emptyResult(let error):
            return "Result: \(error)"
        }
    }
}
