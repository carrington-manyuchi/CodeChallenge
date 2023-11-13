//
//  HomeViewController.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/13.
//

import UIKit

class HomeViewController: UIViewController {
    
    let emailTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "Email"
           textField.borderStyle = .roundedRect
           textField.translatesAutoresizingMaskIntoConstraints = false
           return textField
       }()
       
       let placeOfBirthTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "Place of Birth"
           textField.borderStyle = .roundedRect
           textField.translatesAutoresizingMaskIntoConstraints = false
           return textField
       }()
    
    let nextButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Next", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
            return button
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray3
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        view.addSubview(nextButton)
        view.addSubview(emailTextField)
        view.addSubview(placeOfBirthTextField)
        configureConstraints()
        
        title = "Home VC"
    }
    
    @objc func nextButtonTapped() {
        let employVC = EmployViewController()
        employVC.email = emailTextField.text
        employVC.placeOfBirth = placeOfBirthTextField.text
        navigationController?.pushViewController(employVC, animated: true)
    }
    
    private func configureConstraints() {
        
        let emailTextFieldConstraints = [
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let placeOfBirthTextFieldConstraints = [
            placeOfBirthTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            placeOfBirthTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            placeOfBirthTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            placeOfBirthTextField.heightAnchor.constraint(equalToConstant: 40)
        
        ]
        let nextButtonConstraints = [
            nextButton.topAnchor.constraint(equalTo: placeOfBirthTextField.bottomAnchor, constant: 20),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 45),
            nextButton.widthAnchor.constraint(equalToConstant: 200)
        ]
        
        NSLayoutConstraint.activate(emailTextFieldConstraints)
        NSLayoutConstraint.activate(placeOfBirthTextFieldConstraints)
        NSLayoutConstraint.activate(nextButtonConstraints)
    }
    
    
}
