// BingSearchViewController
//  BingSearchViewController.swift
//  SearchEngineAPIDemo
//  View Controller containing the search text field, submit button, and results table view when using Bing to search
//  Created by James Lane on 11/20/21.
//

import UIKit

class BingSearchViewController : UIViewController, UITextViewDelegate {
    
    //MARK: IBOutlets
    
    @IBOutlet var bingSearchTableView: UITableView!
    @IBOutlet var bingSearchTextField: UITextField!
    
    //MARK: Variables
    
    let tableViewConfig = SearchTableConfiguration(type: .Bing)
    
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure UI
        
        self.bingSearchTableView.delegate = tableViewConfig
        self.bingSearchTableView.dataSource = tableViewConfig
        self.bingSearchTextField.returnKeyType = .done
        
        self.bingSearchTableView.register(SearchResultTableViewCell.self,
                                          forCellReuseIdentifier: Constants.CELL_ID)
        
    }
    
    //MARK: IBActions
    
    @IBAction func didTapSubmitButton(_ sender: UIButton) {
        
        // Save the input when the submit button is pressed
        
        if let input = self.bingSearchTextField.text, !input.isEmpty {

            SearchingService.shared.currentQuery = input
        }
        
        if let query = SearchingService.shared.currentQuery, !query.isEmpty {
            
            self.view.showProgress()
            
            SearchingService.shared.searchBingForCurrentQuery { result in
                
                DispatchQueue.main.async {
                    
                    // Tell the screen we're done
                    self.view.hideProgress()
                    self.bingSearchTableView.reloadData()
                    
                    do {
                        let searches = try result.get()
                        self.view.showResultsNotification(numOfResults: searches.results.searchesFound.count, actualNumOfResults: searches.results.totalEstimatedMatches)
                    }
                    catch let error {
                        print("Bing Search error: " + String(describing:error))
                        self.view.showError(description: String(describing:error))
                    }
                }
            }
        }
        
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
