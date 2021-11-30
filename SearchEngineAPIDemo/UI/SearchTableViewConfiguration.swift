//
//  SearchTableViewConfiguration.swift
//  SearchEngineAPIDemo
//  Universal holder for a UITableViewDelegate and UITableViewDataSource used by both Google and Bing
//  Created by James Lane on 11/20/21.
//

import Foundation
import UIKit

class SearchTableConfiguration : NSObject, UITableViewDelegate, UITableViewDataSource {
    
    public enum ResultType {
        case Bing
        case Google
    }
    
    private var resultType : ResultType?
    
    public init(type : ResultType) {
        
        super.init()
        self.resultType = type
    }
    
    //MARK: Helpers
    
    func goToLink(link : String) {
        
        if let url = URL(string: link) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.resultType == .Google {
            
            if let results = SearchingService.shared.GoogleResults {
                
                self.goToLink(link: results[indexPath.row].link)
            }
        }
        else
        {
            if let results = SearchingService.shared.BingResults {
                
                self.goToLink(link: results[indexPath.row].link)
            }
        }
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.resultType == .Google {
            
            if let results = SearchingService.shared.GoogleResults {
                return results.count
            }
            else
            {
                return 0
            }
        }
        else {
            
            if let results = SearchingService.shared.BingResults {
                return results.count
            }
            else {
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CELL_ID) as! SearchResultTableViewCell
        
        if self.resultType == .Google {
            
            if let results = SearchingService.shared.GoogleResults {
                
                let result = results[indexPath.row]
                cell.setupCell(title: result.title, description: result.description)
            }
        }
        else {
            
            if let results = SearchingService.shared.BingResults {
                
                let result = results[indexPath.row]
                cell.setupCell(title: result.title, description: result.description)
            }
        }
        
        return cell
    }
    
    
    
    
    
}
