//
//  GoogleSearchResult.swift
//  MindstrongAssessment
//  Object model to wrap an individual search result from Google
//  Created by James Lane on 11/19/21.
//

import Foundation

public struct GoogleSearchResult : Codable {
    
    public var title : String
    public var link : String
    public var description : String
}
