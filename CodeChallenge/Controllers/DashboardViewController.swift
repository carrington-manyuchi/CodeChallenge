//
//  DashboardViewController.swift
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
    
    private let cardView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.layer.borderColor = UIColor.systemGray5.cgColor
        myView.layer.borderWidth = 1
        return myView
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        date.tintColor = .white
        date.backgroundColor = .lightGray
        date.layer.cornerRadius = 10
        return date
    }()
    
    private let placeOfBirth: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.borderStyle = .roundedRect
        textField.placeholder = "Place of birth"
        return  textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        title = "Employee"
        setupUI()
        configureConstraints()
        configureNextButton()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cardViewTapped))
        cardView.addGestureRecognizer(tapGesture)
        cardView.isUserInteractionEnabled = true
    }
    
    @objc private func cardViewTapped() {
        let vc = EmployeesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc internal override func didTapNextButton() {
        let vc = AdditionalInfoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUI() {
        view.addSubview(dashboardTitleLabel)
        view.addSubview(cardView)
        cardView.addSubview(nextImageView)
        cardView.addSubview(avatarImageView)
        cardView.addSubview(displayNameLabel)
        cardView.addSubview(emailLabel)
        view.addSubview(dateOfBirth)
        view.addSubview(placeOfBirth)
    }
    
    private func configureConstraints() {
        
        let dashboardTitleLabelConstraints = [
            dashboardTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            dashboardTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
        ]
        
        let cardViewConstraints = [
            cardView.topAnchor.constraint(equalTo: dashboardTitleLabel.bottomAnchor, constant: 5),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //cardView.heightAnchor.constraint(equalToConstant: 200)
        ]
        
        let avatarImageViewConstraints = [
            avatarImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 15),
            avatarImageView.leadingAnchor.constraint(equalTo: cardView.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let nextImageViewConstraints = [
            nextImageView.trailingAnchor.constraint(equalTo: cardView.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            nextImageView.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
        ]
        
        let displayNameLabelConstraints = [
            displayNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            displayNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 25),
        ]
        
        let emailLabelConstraints = [
            emailLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor, constant: 1),
            emailLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            emailLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
        ]
        
        let dateOfBirthConstraints = [
            dateOfBirth.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 50),
            dateOfBirth.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            dateOfBirth.heightAnchor.constraint(equalToConstant: 40),
            dateOfBirth.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        ]
        
        let placeOfBirthConstraints = [
            placeOfBirth.topAnchor.constraint(equalTo: dateOfBirth.bottomAnchor, constant: 30),
            placeOfBirth.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            placeOfBirth.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            placeOfBirth.heightAnchor.constraint(equalToConstant: 40),
        ]
        
        NSLayoutConstraint.activate(dashboardTitleLabelConstraints)
        NSLayoutConstraint.activate(cardViewConstraints)
        NSLayoutConstraint.activate(avatarImageViewConstraints)
        NSLayoutConstraint.activate(nextImageViewConstraints)
        NSLayoutConstraint.activate(displayNameLabelConstraints)
        NSLayoutConstraint.activate(emailLabelConstraints)
        NSLayoutConstraint.activate(dateOfBirthConstraints)
        NSLayoutConstraint.activate(placeOfBirthConstraints)
       
    }


}
