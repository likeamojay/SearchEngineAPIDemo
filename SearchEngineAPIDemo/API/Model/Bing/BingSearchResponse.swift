//
//  BingSearchResponse.swift
//  SearchEngineAPIDemo
//  Object model for wrapping the result of Bing search query
//  Created by James Lane on 11/20/21.
//

import Foundation

struct BingSearchResponse : Codable {
    
    public var results : BingSearchResults
    
    enum CodingKeys : String, CodingKey {
        case results = "webPages"
    }
}
