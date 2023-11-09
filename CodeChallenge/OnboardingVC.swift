//
//  OnboardingVC.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/09.
//

import UIKit

class OnboardingVC: UIViewController {
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "See what's happening in the world of IOS right now."
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Go Next", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        button.backgroundColor = .customBlueColor
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.layer.cornerRadius = 30
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(welcomeLabel)
        view.addSubview(nextButton)
        configureConstraints()
    }
    
    private func configureConstraints() {
        let welcomeLabeConstraints = [
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
                
        let nextButtonConstraints = [
            nextButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            nextButton.widthAnchor.constraint(equalToConstant: 250),
            nextButton.heightAnchor.constraint(equalToConstant: 65),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(welcomeLabeConstraints)
        NSLayoutConstraint.activate(nextButtonConstraints)
    }

}
