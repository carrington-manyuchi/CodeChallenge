//
//  ReviewViewController.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.
//

import UIKit

class ReviewViewController: BaseViewController {
    
    private let personalDetailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Personal Details"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private let reviewCardView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.layer.borderColor = UIColor.systemGray5.cgColor
        myView.layer.borderWidth = 1
        myView.layer.shadowColor = UIColor.systemGray5.cgColor
        myView.layer.shadowOffset = CGSize(width: 1, height: 2)
        myView.layer.shadowOpacity = 0.5
        myView.layer.shadowRadius = 1
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

    private let displayFullNameLabel: UILabel = {
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
    
    private let dateOfBirthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "20 Dec 1998"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Male"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let additionalInformationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Additional Information"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private let colorNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Brown"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let placeOfBirthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Netcare, Johannesburg"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let residentialAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fourways, Extension 10"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 21, weight: .bold)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.systemGray.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 7)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 3
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.backgroundColor = .blue
        title = "Review"
        submitButton.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
        setupUI()
        configureConstraints()
    }
    
    @objc private func didTapSubmitButton() {
        let vc = SuccessViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        /** Personal details  setup**/
        view.addSubview(personalDetailsLabel)
        view.addSubview(reviewCardView)
        reviewCardView.addSubview(avatarImageView)
        reviewCardView.addSubview(displayFullNameLabel)
        reviewCardView.addSubview(dateOfBirthLabel)
        reviewCardView.addSubview(emailLabel)
        reviewCardView.addSubview(genderLabel)
        /** Additional information setup **/
        view.addSubview(additionalInformationLabel)
        view.addSubview(colorNameLabel)
        view.addSubview(placeOfBirthLabel)
        view.addSubview(residentialAddressLabel)
        view.addSubview(submitButton)
    }
    
    private func configureConstraints() {
        let personalDetailsLabelConstraints = [
            personalDetailsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            personalDetailsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
        ]
        
        let reviewCardViewConstraints = [
            reviewCardView.topAnchor.constraint(equalTo: personalDetailsLabel.bottomAnchor, constant: 2),
            reviewCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reviewCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ]
        
        let avatarImageViewConstraints = [
            avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            avatarImageView.topAnchor.constraint(equalTo: reviewCardView.topAnchor, constant: 20),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
        ]
        
        let displayFullNameLabelConstraints = [
            displayFullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            displayFullNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor)
        ]
        
        let emailLabelConstraints = [
            emailLabel.leadingAnchor.constraint(equalTo: displayFullNameLabel.leadingAnchor),
            emailLabel.topAnchor.constraint(equalTo: displayFullNameLabel.bottomAnchor, constant: 8),
        ]
        
        let dateOfBirthLabelConstraints = [
            dateOfBirthLabel.leadingAnchor.constraint(equalTo: displayFullNameLabel.leadingAnchor),
            dateOfBirthLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
        ]
        
        let genderLabelConstraints = [
            genderLabel.leadingAnchor.constraint(equalTo: displayFullNameLabel.leadingAnchor),
            genderLabel.topAnchor.constraint(equalTo: dateOfBirthLabel.bottomAnchor, constant: 8),
            genderLabel.bottomAnchor.constraint(equalTo: reviewCardView.bottomAnchor, constant: -20)

        ]
        
        let additionalInformationLabelConstraints = [
            additionalInformationLabel.leadingAnchor.constraint(equalTo: personalDetailsLabel.leadingAnchor),
            additionalInformationLabel.topAnchor.constraint(equalTo: reviewCardView.bottomAnchor, constant: 40),
        ]
        
        let colorNameLabelConstraints = [
            colorNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            colorNameLabel.topAnchor.constraint(equalTo: additionalInformationLabel.bottomAnchor, constant: 8),
        ]
        
        let placeOfBirthLabelConstraints = [
            placeOfBirthLabel.leadingAnchor.constraint(equalTo: colorNameLabel.leadingAnchor),
            placeOfBirthLabel.topAnchor.constraint(equalTo: colorNameLabel.bottomAnchor, constant: 5),
        ]
        
        let residentialAddressLabelConstraints = [
            residentialAddressLabel.leadingAnchor.constraint(equalTo: colorNameLabel.leadingAnchor),
            residentialAddressLabel.topAnchor.constraint(equalTo: placeOfBirthLabel.bottomAnchor, constant: 5),
        ]
        
        let submitButtonConstraints = [
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.widthAnchor.constraint(equalToConstant: 200),
            submitButton.heightAnchor.constraint(equalToConstant: 50),
        ]
        /** Personal details **/
        NSLayoutConstraint.activate(personalDetailsLabelConstraints)
        NSLayoutConstraint.activate(reviewCardViewConstraints)
        NSLayoutConstraint.activate(avatarImageViewConstraints)
        NSLayoutConstraint.activate(displayFullNameLabelConstraints)
        NSLayoutConstraint.activate(emailLabelConstraints)
        NSLayoutConstraint.activate(dateOfBirthLabelConstraints)
        NSLayoutConstraint.activate(genderLabelConstraints)
        /** Additional information **/
        NSLayoutConstraint.activate(additionalInformationLabelConstraints)
        NSLayoutConstraint.activate(colorNameLabelConstraints)
        NSLayoutConstraint.activate(placeOfBirthLabelConstraints)
        NSLayoutConstraint.activate(residentialAddressLabelConstraints)
        
        NSLayoutConstraint.activate(submitButtonConstraints)
    }
}
