//
//  BingSearchResult.swift
//  MindstrongAssessment
//  Object wrapper for a search result from Bing Search API
//  Created by James Lane on 11/20/21.
//

import Foundation

struct BingSearchResult : Codable {
    
    public var title : String
    public var description : String
    public var link : String
    
    enum CodingKeys : String, CodingKey {
        
        case title = "name"
        case description = "snippet"
        case link = "displayUrl"
    }
}
