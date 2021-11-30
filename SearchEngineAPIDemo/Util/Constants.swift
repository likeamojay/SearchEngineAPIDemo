//
//  Constants.swift
//  SearchEngineAPIDemo
//  Holder for constant values used by the app
//  Created by James Lane on 11/19/21.
//

import Foundation

public class Constants {
    
    // Cell Reuse Id for Search result table cell
    public static let CELL_ID = "SearchResultTabelViewCell"
    
    // Googio API Key
    public static let GOOGIO_API_KEY = "d59a99fd-d4a8-4539-9ec0-196f7d026f5d"
    
    // Googio is a 3rd party endpoint that provides google search functionality and allows 100 requests for free / day
    public static let GOOGIO_SEARCH_API_URL = "https://api.goog.io/v1/search/q="
    
    // Use these args to restrict any Google search results to English, sites from US, and maximum of 100 search results to avoid blowing up the UI
    public static let GOOGLE_LANG_AND_COUNTRY_ARGS = "&lr=lang_en&cr=countryUS&num=100"
    
    // Use these args to restrict any bing search sites from US, and maximum of 100 search results to avoid blowing up the UI
    public static let BING_LANG_AND_COUNTRY_ARGS = "&count=100&setLang=en"
    
    // API Endpoint URL to Bing search endpoint
    public static let BING_API_SEARCH_URL = "https://api.bing.microsoft.com/v7.0/search?q=%22"
    
    // Bing API Key 1
    public static let BING_API_KEY_1 = "efd09da494c34c8d92139333e04f2d8a"
    
}
