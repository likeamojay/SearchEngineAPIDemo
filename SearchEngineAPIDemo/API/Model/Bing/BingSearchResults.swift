//
//  BingSearchResults.swift
//  MindstrongAssessment
//  Object wrapper for response from bing search API
//  Created by James Lane on 11/20/21.
//

import Foundation

struct BingSearchResults : Codable {
    
    public var webSearchUrl : String
    public var totalEstimatedMatches : Int
    public var searchesFound : [BingSearchResult]
    
    enum CodingKeys : String, CodingKey {
        
        case webSearchUrl = "webSearchUrl"
        case totalEstimatedMatches = "totalEstimatedMatches"
        case searchesFound = "value"
    }
    
}
