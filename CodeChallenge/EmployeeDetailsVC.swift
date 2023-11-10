//
//  EmployeeDetailsVC.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.
//

import UIKit

class EmployeeDetailsVC: UIViewController {
    
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
        textField.borderStyle = .roundedRect
        textField.placeholder = "place of birth"
        return  textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureConstraints()
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
            avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        displayNameLabelConstraints = [
        ]
    }


}
