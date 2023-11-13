//
//  EmployeesTableViewCell.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/09.
/***TableViewCell: A specialized type of view that manages the content of a single table row
 **Defines a blueprint of how a single cell should look like*/

import UIKit

class EmployeesTableViewCell: UITableViewCell {
        
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

     let displayNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "Carrington Manyuchi"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let displayEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "carrington@gmail.com"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    static let identifier  = "EmployeesTableViewCell"

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
        cardView.addSubview(avatarImageView)
        cardView.addSubview(displayNameLabel)
        cardView.addSubview(displayEmailLabel)
    }
    
    func configure(with employee: Employee) {
        displayNameLabel.text = (employee.firstName ?? "") + " " + (employee.lastName ?? "")
        displayEmailLabel.text = employee.email
        
        if let url = URL(string: employee.avatar ?? "") {
            avatarImageView.downloaded(from: url)
                    //cell.imageView?.downloaded(from: url)
                }
        
//        let data = employee.avatar
//        avatarImageView.image = UIImage(data: data)
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


//Download API Image
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
