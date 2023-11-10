//
//  APIError.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodeError
    case networkError
    
    var message: String {
        switch self {
        case .invalidURL:
            return NSLocalizedString("The provided URL is not valid",
                                     comment: "Invalid URL")
        case .requestFailed:
            return NSLocalizedString("The request has failed to complete. Please try again",
                                     comment: "Request failure")
        case .decodeError:
            return NSLocalizedString("Decoding error",
                                     comment: "Request failed")
        case .networkError:
            return NSLocalizedString("No Network error",
                                     comment: "Request failed")
        }
    }
}
