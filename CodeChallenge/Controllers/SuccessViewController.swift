//
//  SuccessViewController.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/11.
//

import UIKit

class SuccessViewController: UIViewController {
        
    private let successImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "checkmark.circle")
        imageView.tintColor = .green
        return imageView
    }()
    
    private let successLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Success"
        label.font = .systemFont(ofSize: 21, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    private let successMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse est leo, vehicula eu eleifend non, auctor ut arcu, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse est leo, vehicula eu eleifend non, auctor ut arcu"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        label.sizeToFit()
        label.textAlignment = .justified
        return label
    }()
    
    private let successDoneButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 21, weight: .bold)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.systemGray.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 7)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 3
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureConstraints()
        
        successDoneButton.addTarget(self, action: #selector(didTapDoneButton), for: .touchUpInside)
    }
    
    
    @objc private func didTapDoneButton() {
        dismiss(animated: true)
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupViews() {
        navigationController?.navigationBar.isHidden = true

        view.backgroundColor = .systemBackground
        view.addSubview(successImageView)
        view.addSubview(successLabel)
        view.addSubview(successMessageLabel)
        view.addSubview(successDoneButton)
    }
    
    private func configureConstraints() {
        let successImageViewConstraints = [
            successImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            successImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            successImageView.heightAnchor.constraint(equalToConstant: 120),
            successImageView.widthAnchor.constraint(equalToConstant: 120),
        ]
        
        let successLabelConstraints = [
            successLabel.topAnchor.constraint(equalTo: successImageView.bottomAnchor, constant: 50),
            successLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let successMessageLabelConstraints = [
            successMessageLabel.topAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 20),
            successMessageLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            successMessageLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        ]
        
        let successDoneButtonConstraint = [
            successDoneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            successDoneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            successDoneButton.widthAnchor.constraint(equalToConstant: 200),
            successDoneButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(successImageViewConstraints)
        NSLayoutConstraint.activate(successLabelConstraints)
        NSLayoutConstraint.activate(successMessageLabelConstraints)
        NSLayoutConstraint.activate(successDoneButtonConstraint)
    }
    
}
