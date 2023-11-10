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
        setupUI()
        configureConstraints()
        configureNextButton()
        
    }
    
    @objc private func nextButtonTapped() {
        let vc = AdditionalInfo()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(dashboardTitleLabel)

        view.addSubview(dateOfBirth)
        view.addSubview(placeOfBirth)
    }
    
    private func configureConstraints() {
        
        
        let dashboardTitleLabelConstraints = [
            dashboardTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            dashboardTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
        ]
        
        
//        let dateOfBirthConstraints = [
//            dateOfBirth.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 50),
//            dateOfBirth.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
//            dateOfBirth.heightAnchor.constraint(equalToConstant: 40),
//            dateOfBirth.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
//        ]
//        
//        let placeOfBirthConstraints = [
//            placeOfBirth.topAnchor.constraint(equalTo: dateOfBirth.bottomAnchor, constant: 30),
//            placeOfBirth.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
//            placeOfBirth.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
//            placeOfBirth.heightAnchor.constraint(equalToConstant: 40),
//        ]
        
//        NSLayoutConstraint.activate(dashboardTitleLabelConstraints)
//        NSLayoutConstraint.activate(avatarImageViewConstraints)
//        NSLayoutConstraint.activate(displayNameLabelConstraints)
//        NSLayoutConstraint.activate(emailLabelConstraints)
//        NSLayoutConstraint.activate(dateOfBirthConstraints)
//        NSLayoutConstraint.activate(placeOfBirthConstraints)
//        NSLayoutConstraint.activate(nextImageViewConstraints)
    }


}
