//
//  LoginVC.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/09.
//

import UIKit

class LoginVC: BaseViewController {
    
    private let loginTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.text = "Login to your account"
        label.textColor = .label
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter email"
        textField.autocapitalizationType = .none
        return  textField
    }()
    
    private let passwordtextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.placeholder = "Enter password"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .customBlueColor
        button.tintColor = .white
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        return button
    }()
    
    private lazy var viewModel = LoginViewModel(delegate: self, service: ServiceCalls())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(loginTitleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordtextField)
        view.addSubview(loginButton)
        configureConstraints()
        navigationController?.navigationBar.isHidden = true
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    @objc private func didTapLoginButton() {
        viewModel.login(username: emailTextField.text ?? "", password: passwordtextField.text ?? "")
    }
    
    private func configureConstraints() {
        
        let loginTitleLabelConstraints = [
            loginTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            loginTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let emailTextFieldConstraints = [
            emailTextField.topAnchor.constraint(equalTo: loginTitleLabel.bottomAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 45)
        ]
        
        let passwordtextFieldConstraints = [
            passwordtextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40),
            passwordtextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            passwordtextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            passwordtextField.heightAnchor.constraint(equalToConstant: 45)
        ]
        
        let loginButtonConstraints = [
            loginButton.topAnchor.constraint(equalTo: passwordtextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: passwordtextField.leadingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.widthAnchor.constraint(equalToConstant: 200)
        ]
        
        NSLayoutConstraint.activate(loginTitleLabelConstraints)
        NSLayoutConstraint.activate(emailTextFieldConstraints)
        NSLayoutConstraint.activate(passwordtextFieldConstraints)
        NSLayoutConstraint.activate(loginButtonConstraints)
    }
}

extension LoginVC: LoginDelegate {
    
    func navigateToHomeScreenOnLoginSuccess() {
        
        let vc  = EmployeesVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showErrorsOnLoginFailure() {
        print("showErrorsOnLoginFailure")
    }
    
    func showLoadingIndicator() {
        self.showLoading()
    }
    
    func hideLoadingIndicator() {
        self.hideLoading()
    }
    
    
}
