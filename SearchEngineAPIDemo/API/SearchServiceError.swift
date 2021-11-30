//
//  SearchServiceError.swift
//  SearchEngineAPIDemo
//  Custom Error type for handling search query requests
//  Created by James Lane on 11/19/21.
//

import Foundation

enum SearchServiceError : Error {
    
    case EmptyQuery
    case BadQuery
    case NotFound
    case BadResponse
    case ParseError
    case AccessDenied
    case ExceededFreeNumberOfCalls
}
