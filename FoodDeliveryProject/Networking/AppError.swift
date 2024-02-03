//
//  AppError.swift
//  FoodDeliveryProject
//
//  Created by BadriBharadwaj on 25/01/24.
//

import Foundation

enum AppError : LocalizedError {

    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be Decoded"
        case .unknownError:
            return "BRO!, I don't have any idea what is going on here"
        case .invalidUrl:
            return "HEY!, Give me a valid URL"
        case .serverError(let error):
            return error
        }
    }
}
