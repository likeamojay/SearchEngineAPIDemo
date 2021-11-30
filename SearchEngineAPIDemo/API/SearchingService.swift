//
//  SearchingService.swift
//  SearchEngineAPIDemo
//  Manager class for handling the API calls, responses, and storing responses
//  Created by James Lane on 11/19/21.
//

import Foundation

class SearchingService {
    
    //MARK: Singleton
    
    public static let shared = SearchingService()
    
    //MARK: Variables
    
    public var currentQuery : String?
    
    public var GoogleResults : [GoogleSearchResult]?
    
    public var BingResults : [BingSearchResult]?
    
    private var googioConfiguration : URLSessionConfiguration {
        
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["apiKey" : Constants.GOOGIO_API_KEY]
        return config
    }
    
    private var bingConfiguration : URLSessionConfiguration {
        
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Ocp-Apim-Subscription-Key" : Constants.BING_API_KEY_1]
        return config
        
    }
    
    //MARK: Public methods
    
    public func searchGoogleForCurrentQuery(completion : @escaping ((Result<GoogleSearchResponse,SearchServiceError>)-> Void)) {
        
        if let query = self.currentQuery, !query.isEmpty {
            
            if let url = URL(string: Constants.GOOGIO_SEARCH_API_URL + query.googleSearchQuery() + Constants.GOOGLE_LANG_AND_COUNTRY_ARGS) {
                
                let session = URLSession(configuration: self.googioConfiguration).dataTask(with: url) { data, response, error in
                    
                    if let urlResponse = response as? HTTPURLResponse {
                        
                        if urlResponse.statusCode == 404 {
                            completion(.failure(.NotFound))
                            return
                        }
                        else if urlResponse.statusCode == 402 {
                            completion(.failure(.ExceededFreeNumberOfCalls))
                            return
                        }
                    }
                    
                    if let responseData = data {
                        
                        do {
                        
                            let json = try JSONDecoder().decode(GoogleSearchResponse.self, from: responseData)
                            self.GoogleResults = json.results
                            completion(.success(json))
                            return
                        }
                        catch let error {
                            
                            print("JSON parse error: " + error.localizedDescription)
                            completion(.failure(.ParseError))
                            return
                        }
                    }
                    else {
                        completion(.failure(SearchServiceError.BadResponse))
                        return
                    }
                }
                
                session.resume()
            }
            else
            {
                completion(.failure(.BadQuery))
                return
            }
        }
        else
        {
            completion(.failure(SearchServiceError.EmptyQuery))
            return
        }
    }
    
    public func searchBingForCurrentQuery(completion : @escaping ((Result<BingSearchResponse,SearchServiceError>)-> Void)) {
        
        if let query = self.currentQuery, !query.isEmpty {
        
            if let url = URL(string: Constants.BING_API_SEARCH_URL + query.bingSearchQuery() + Constants.BING_LANG_AND_COUNTRY_ARGS) {
                
                let session = URLSession(configuration: self.bingConfiguration).dataTask(with: url) { data, response, error in
                    
                    if let urlResponse = response as? HTTPURLResponse {
                        
                        if urlResponse.statusCode == 404 {
                            completion(.failure(SearchServiceError.NotFound))
                            return
                        }
                        else if urlResponse.statusCode == 401 {
                            completion(.failure(.AccessDenied))
                            return
                        }
                    }
                    
                    if let responseData = data {
                        
                        do {
                            
                            let json = try JSONDecoder().decode(BingSearchResponse.self, from: responseData)
                            self.BingResults = json.results.searchesFound
                            completion(.success(json))
                            return
                            
                        }
                        catch let error {
                            print("JSON parse error: " + error.localizedDescription)
                            completion(.failure(.ParseError))
                            return
                        }
                        
                    }
                    else {
                        completion(.failure(.BadResponse))
                        return
                    }
                    
                }
                
                session.resume()
            }
            else {
                completion(.failure(.BadQuery))
                return
            }
            
        }
        else {
            
            completion(.failure(.EmptyQuery))
            return
        }
    }
}
