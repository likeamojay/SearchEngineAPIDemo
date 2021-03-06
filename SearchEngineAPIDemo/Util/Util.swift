//
//  Util.swift
//  SearchEngineAPIDemo
//  Useful extensions for abstracting out functionality that isn't neccessary
//  for top-level inspection of view logic
//  Created by James Lane on 11/19/21.
//

import PKHUD
import UIKit

extension UIView {
    
    func showProgress() {
        
        PKHUD.sharedHUD.contentView = PKHUDProgressView(title: "Searching", subtitle: nil)
        PKHUD.sharedHUD.show(onView: self)
    }
    
    func hideProgress() {
        
        PKHUD.sharedHUD.hide()
    }
    
    func showResultsNotification(numOfResults : Int, actualNumOfResults : Int) {
        
        PKHUD.sharedHUD.contentView = PKHUDSuccessView(title: "Finished", subtitle: "Showing " + String(numOfResults) + " out of " + String(actualNumOfResults) + " results")
        PKHUD.sharedHUD.show(onView: self)
    }
    
    func showError(description: String) {
        
        PKHUD.sharedHUD.contentView = PKHUDErrorView(title: nil, subtitle: description)
        PKHUD.sharedHUD.show(onView: self)
    }
}

extension String {
    
    func googleSearchQuery() -> String {
        
        let plusArgs = self.replacingOccurrences(of: " ", with: "+")
        return plusArgs.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? plusArgs
    }
    
    func bingSearchQuery() -> String {
        
        let plusArgs = self.replacingOccurrences(of: " ", with: "+")
        return plusArgs + "%22"
    }
}

public func getKeyFromInfoPlist(key: String) -> String? {
    
    var value : String?
    
    if let infoPlistPath = Bundle.main.url(forResource: "Info", withExtension: "plist") {
        do {
            let infoPlistData = try Data(contentsOf: infoPlistPath)
            
            if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
                
                value = dict[key] as? String
            }
        } catch {
            print(error)
        }
    }
    
    return value

}
