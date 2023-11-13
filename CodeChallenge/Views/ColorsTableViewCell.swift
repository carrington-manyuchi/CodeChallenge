//
//  ColorsTableViewCell.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/11.
/***TableViewCell: A specialized type of view that manages the content of a single table row
 **Defines a blueprint of how a single cell should look like*/

import UIKit

class ColorsTableViewCell: UITableViewCell {
            
     let cardView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.layer.borderColor = UIColor.systemGray5.cgColor
        myView.layer.borderWidth = 1
        return myView
    }()
    
     let selectColorButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
     let colorNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Color Name"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    public static let identifier = "ColorsTableViewCell"

    /** initializing views */
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(cardView)
        cardView.addSubview(selectColorButton)
        cardView.addSubview(colorNameLabel)
    }
    
    func configure(wi)
    
    private func configureConstraints() {
        let cardViewConstraints = [
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ]
        
        let selectColorButtonConstraints = [
            selectColorButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            selectColorButton.leadingAnchor.constraint(equalTo: cardView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            selectColorButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
        ]
        
        let colorNameLabelConstraints = [
            colorNameLabel.leadingAnchor.constraint(equalTo: selectColorButton.trailingAnchor, constant: 20),
            colorNameLabel.centerYAnchor.constraint(equalTo: selectColorButton.centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(cardViewConstraints)
        NSLayoutConstraint.activate(selectColorButtonConstraints)
        NSLayoutConstraint.activate(colorNameLabelConstraints)
    }
    
}
