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
        label.font = .systemFont(ofSize: 35, weight: .heavy)
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

    }

}
