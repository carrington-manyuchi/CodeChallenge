//  OnboardingViewController.swift
//  CodeChallenge
//  Created by DA MAC M1 157 on 2023/11/09.
//

import UIKit

class OnboardingViewController: BaseViewController {
    
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
        button.setTitle("Click Next", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.systemGray.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 7)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 2
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.backgroundColor = UIColorFromRGB(rgbValue: 0x39A7FF)
        view.addSubview(welcomeLabel)
        view.addSubview(nextButton)
        configureConstraints()
        navigationController?.navigationBar.isHidden = true
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
    }
    
    @objc internal override func didTapNextButton() {
        let vc = UINavigationController(rootViewController: LoginViewController())
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true)
    }
    
    private func configureConstraints() {
        
        let welcomeLabeConstraints = [
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
                
        let nextButtonConstraints = [
            nextButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nextButton.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            nextButton.heightAnchor.constraint(equalToConstant: 45),
        ]
        
        NSLayoutConstraint.activate(welcomeLabeConstraints)
        NSLayoutConstraint.activate(nextButtonConstraints)
    }
   

}
