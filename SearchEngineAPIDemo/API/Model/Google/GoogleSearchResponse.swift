//
//  GoogleSearchResponse.swift
//  SearchEngineAPIDemo
//  Object model to wrap response from a google search API Call
//  Created by James Lane on 11/19/21.
//

import Foundation

public struct GoogleSearchResponse : Codable {
    
    public var results : [GoogleSearchResult]
    public var actualTotalNumberOfResults : Int
    public var answer : String?
    
    enum CodingKeys : String, CodingKey {
        
        case results = "results"
        case actualTotalNumberOfResults = "total"
        case answer = "answer"
    }
}
