//
//  GoogleSearchResultTableViewCell.swift
//  SearchEngineAPIDemo
//  Universal reusable table view cell used for both Google and Bing search result table views
//  Created by James Lane on 11/19/21.
//

import UIKit

class SearchResultTableViewCell : UITableViewCell {
    
    //MARK: UI Elements
    
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    //MARK: Cell lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupElements()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        
        titleLabel.text = nil
        descriptionLabel.text = nil
    }
    
    //MARK: Helpers
    
    func setupElements() {
        
        // title label
        titleLabel.textColor = UIColor.gray
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12), titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12), titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8)])
        
        // description label
        descriptionLabel.textColor = UIColor.gray
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 752), for: .vertical)
        
        self.contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12), descriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12), descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8), descriptionLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8)])
    }
    
    func setupCell(title: String, description : String) {
        
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }
}
