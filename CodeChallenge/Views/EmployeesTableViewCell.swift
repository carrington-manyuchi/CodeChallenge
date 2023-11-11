//
//  EmployeesTableViewCell.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/09.
//

import UIKit

class EmployeesTableViewCell: UITableViewCell {
    
    static let identifier  = "EmployeesTableViewCell"
    
    private let cardView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.layer.borderColor = UIColor.systemGray5.cgColor
        myView.layer.borderWidth = 1
        return myView
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .red
        return imageView
    }()

    private let displayNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Carrington Manyuchi"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let displayEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "carrington@gmail.com"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    // first lets initialize our views
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
        cardView.addSubview(avatarImageView)
        cardView.addSubview(displayNameLabel)
        cardView.addSubview(displayEmailLabel)
    }
    
    private func configureConstraints() {
        
        let cardViewConstraints = [
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ]
                    
        let avatarImageViewConstraints = [
            avatarImageView.leadingAnchor.constraint(equalTo: cardView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            avatarImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
        ]
        
        let displayNameLabelConstraints = [
            displayNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            displayNameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20)
        ]
        
        let displayEmailLabelConstraints = [
            displayEmailLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            displayEmailLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor, constant: 2),
            displayEmailLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20)
        ]
        
        NSLayoutConstraint.activate(cardViewConstraints)
        NSLayoutConstraint.activate(avatarImageViewConstraints)
        NSLayoutConstraint.activate(displayNameLabelConstraints)
        NSLayoutConstraint.activate(displayEmailLabelConstraints)
    }
    
}
