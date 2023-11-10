//
//  ReviewVC.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.
//

import UIKit

class ReviewVC: UIViewController {
    
    private let personalDetailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Personal Details"
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        return label
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemRed
        return imageView
    }()

    private let displayFullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Carrington Manyuchi"
        label.font = .systemFont(ofSize: 21, weight: .medium)
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "carrington@gmail.com"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let dateOfBirthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "20 Dec 1998"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Male"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let additionalInformationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Additional Information"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let colorNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "20 Dec 1998"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let placeOfBirthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "20 Dec 1998"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let residentialAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "20 Dec 1998"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        //personal details
        view.addSubview(personalDetailsLabel)
        view.addSubview(avatarImageView)
        view.addSubview(displayFullNameLabel)
        view.addSubview(dateOfBirthLabel)
        view.addSubview(emailLabel)
        view.addSubview(genderLabel)
    }
    
    private func configureConstraints() {
        let personalDetailsLabelConstraints = [
            personalDetailsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            personalDetailsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        ]
        
        let avatarImageViewConstraints = [
            avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            avatarImageView.topAnchor.constraint(equalTo: personalDetailsLabel.bottomAnchor, constant: 30),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
        ]
        
        let displayFullNameLabelConstraints = [
            displayFullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            displayFullNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor)
        ]
        
        let emailLabelConstraints = [
            emailLabel.leadingAnchor.constraint(equalTo: displayFullNameLabel.leadingAnchor),
            emailLabel.topAnchor.constraint(equalTo: displayFullNameLabel.bottomAnchor, constant: 12),
        ]
        
        let dateOfBirthLabelConstraints = [
            dateOfBirthLabel.leadingAnchor.constraint(equalTo: displayFullNameLabel.leadingAnchor),
            dateOfBirthLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 12),
        ]
        
        let genderLabelConstraints = [
            genderLabel.leadingAnchor.constraint(equalTo: displayFullNameLabel.leadingAnchor),
            genderLabel.topAnchor.constraint(equalTo: dateOfBirthLabel.bottomAnchor, constant: 12)
        ]
        
        NSLayoutConstraint.activate(personalDetailsLabelConstraints)
        NSLayoutConstraint.activate(avatarImageViewConstraints)
        NSLayoutConstraint.activate(displayFullNameLabelConstraints)
        NSLayoutConstraint.activate(emailLabelConstraints)
        NSLayoutConstraint.activate(dateOfBirthLabelConstraints)
        NSLayoutConstraint.activate(genderLabelConstraints)
    }
}
