//
//  ViewController.swift
//  SearchEngineAPIDemo
//  View Controller containing the search text field, submit button, and results table view when using Google to search
//  Created by James Lane on 11/18/21.
//

import UIKit

class GoogleSearchViewController: UIViewController, UITextFieldDelegate {

    //MARK: IBOutlets
    
    @IBOutlet var GoogleSearchTextField: UITextField!
    @IBOutlet var GoogleSearchTableView: UITableView!
    
    //MARK: Variables
    
    let tableViewConfig = SearchTableConfiguration(type: .Google)
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Configure UI
        
        self.GoogleSearchTableView.dataSource = self.tableViewConfig
        self.GoogleSearchTableView.delegate = self.tableViewConfig
        self.GoogleSearchTextField.returnKeyType = .done
        
        self.GoogleSearchTableView.register(SearchResultTableViewCell.self, forCellReuseIdentifier: Constants.CELL_ID)
    }
    
    //MARK: IBActions
    
    @IBAction func DidTapSearchButton(_ sender: UIButton) {
        
        // Save the input when the submit button is pressed
        
        if let input = GoogleSearchTextField.text, !input.isEmpty {

            SearchingService.shared.currentQuery = input
        }
        
        if let query = SearchingService.shared.currentQuery, !query.isEmpty {
            
            self.view.showProgress()
            
            SearchingService.shared.searchGoogleForCurrentQuery { result in
                
                DispatchQueue.main.async {
                    
                    // Tell the screen we're done
                    self.view.hideProgress()
                    self.GoogleSearchTableView.reloadData()
                    
                    do {
                        let searches = try result.get()
                        self.view.showResultsNotification(numOfResults: searches.results.count, actualNumOfResults: searches.actualTotalNumberOfResults)
                    }
                    catch let error {
                        print("Google Search error: " + String(describing:error))
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

