//
//  EmployeeDetailsVC.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.
//

import UIKit

class EmployeeDetailsVC: BaseViewController {
    
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

    private let displayNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Carrington Manyuchi"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "carrington@gmail.com"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    
    private let dateOfBirth: UIDatePicker = {
        let date = UIDatePicker()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.datePickerMode = .date
        date.locale = Locale.current
        date.timeZone = .current
        date.date = Date(timeIntervalSince1970: 10)
        date.minimumDate = Date(timeIntervalSince1970: 20)
        date.maximumDate = Date(timeIntervalSinceNow: 0)
        return date
    }()
    
    
    private let placeOfBirth: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.borderStyle = .line
        textField.placeholder = "Place of birth"
        return  textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureConstraints()
        title = "Employee Detail"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextButtonTapped))
    }
    
    @objc private func nextButtonTapped() {
        let vc = AdditionalInfo()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(avatarImageView)
        view.addSubview(displayNameLabel)
        view.addSubview(emailLabel)
        view.addSubview(dateOfBirth)
        view.addSubview(placeOfBirth)
    }
    
    private func configureConstraints() {
        
        let avatarImageViewConstraints = [
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        let displayNameLabelConstraints = [
            //displayNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            displayNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 30),
            displayNameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            displayNameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor)
        ]
        
        let emailLabelConstraints = [
            emailLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor, constant: 2),
            emailLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 30),
            emailLabel.trailingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5)
        ]
        
        let dateOfBirthConstraints = [
            dateOfBirth.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 50),
            dateOfBirth.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 30),
        ]
        
        
        let placeOfBirthConstraints = [
            placeOfBirth.topAnchor.constraint(equalTo: dateOfBirth.bottomAnchor, constant: 30),
            placeOfBirth.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 30),
            placeOfBirth.widthAnchor.constraint(equalToConstant: 200),
            placeOfBirth.heightAnchor.constraint(equalToConstant: 40),
        ]
        
        NSLayoutConstraint.activate(avatarImageViewConstraints)
        NSLayoutConstraint.activate(displayNameLabelConstraints)
        NSLayoutConstraint.activate(emailLabelConstraints)
        NSLayoutConstraint.activate(dateOfBirthConstraints)
        NSLayoutConstraint.activate(placeOfBirthConstraints)
    }


}
