//
//  Error.swift
//  Neostore_Chaitanya
//
//  Created by Neosoft on 25/01/22.
//

import Foundation

enum APIError: Error{
    case badURL(message: String)
    case decoding(message: String)
    case parsing(message: String)
    case encoding(message: String)
    case unsuccess(message: String)
    
    var getErrorMsg: String {
        switch self {
        case .badURL(let message):
            return message
        case .decoding(let message):
            return message
        case .encoding(let message):
            return message
        case .unsuccess(let message):
            return message
        case .parsing(let message):
            return message
        }
    }
    
}
