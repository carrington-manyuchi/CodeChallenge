//
//  EmployeeDetailsVC.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.
//

import UIKit

class DashboardViewController: BaseViewController {
    
    
    private let dashboardTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select an Employee"
        label.textColor  = .label
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
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
    
    private let nextImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "chevron.forward")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
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
    }
    
    @objc private func nextButtonTapped() {
        let vc = AdditionalInfo()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(dashboardTitleLabel)
        view.addSubview(avatarImageView)
        view.addSubview(displayNameLabel)
        view.addSubview(emailLabel)
        view.addSubview(dateOfBirth)
        view.addSubview(placeOfBirth)
    }
    
    private func configureConstraints() {
        
        
        let dashboardTitleLabelConstraints = [
            dashboardTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            dashboardTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
        ]
        
        let avatarImageViewConstraints = [
            avatarImageView.topAnchor.constraint(equalTo: dashboardTitleLabel.bottomAnchor, constant: 15),
            avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40)
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
        
        NSLayoutConstraint.activate(dashboardTitleLabelConstraints)
        NSLayoutConstraint.activate(avatarImageViewConstraints)
        NSLayoutConstraint.activate(displayNameLabelConstraints)
        NSLayoutConstraint.activate(emailLabelConstraints)
        NSLayoutConstraint.activate(dateOfBirthConstraints)
        NSLayoutConstraint.activate(placeOfBirthConstraints)
    }


}
