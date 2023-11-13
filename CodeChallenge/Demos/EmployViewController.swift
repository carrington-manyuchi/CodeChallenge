//
//  EmployViewController.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/13.
//

import UIKit

class EmployViewController: UIViewController {
    var email: String?
    var placeOfBirth: String?
    
    let nameLabel: UILabel = {
            let label = UILabel()
            label.text = "Name:"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let surnameLabel: UILabel = {
            let label = UILabel()
            label.text = "Surname:"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    let nextButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Next", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
            return button
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        view.addSubview(nextButton)
        view.addSubview(nameLabel)
        view.addSubview(surnameLabel)
        view.backgroundColor = .systemGray3
        configureConstraints()
        
        title = "EmployVC"
        
        
        nameLabel.text = email
        surnameLabel.text = placeOfBirth
    }
    
    @objc func nextButtonTapped() {
        let additionalVC = AdditionalVC()
        additionalVC.email = email
        additionalVC.placeOfBirth = placeOfBirth
        additionalVC.name = nameLabel.text
        additionalVC.surname = surnameLabel.text
        navigationController?.pushViewController(additionalVC, animated: true)
    }
    
    private func configureConstraints() {
        let nameLabelConstraints = [
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
        ]
        let surnameLabelConstraints = [
            surnameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            surnameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        let nextButtonConstraints = [
            nextButton.topAnchor.constraint(equalTo: surnameLabel.bottomAnchor, constant: 20),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 45),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
        ]
        
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(surnameLabelConstraints)
        NSLayoutConstraint.activate(nextButtonConstraints)
    }
}
