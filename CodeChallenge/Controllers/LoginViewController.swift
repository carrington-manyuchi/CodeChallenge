//
//  LoginViewController.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/09.
//

import UIKit

class LoginViewController: BaseViewController {
    
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
        textField.placeholder = "Enter email..."
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.clearButtonMode = .always
        return  textField
    }()
    
    private let passwordtextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.placeholder = "Enter password"
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowRadius = 2
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.systemGray.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 7)
        button.layer.shadowOpacity = 0.9
        
       
        return button
    }()
    
    private lazy var viewModel = LoginViewModel(delegate: self, service: ServiceCalls())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.backgroundColor = UIColorFromRGB(rgbValue: 0x39A7FF)
        view.addSubview(loginTitleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordtextField)
        view.addSubview(loginButton)
        configureConstraints()
        navigationController?.navigationBar.isHidden = true
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    @objc private func didTapLoginButton() {
        
        guard let user = emailTextField.text, emailTextField.text?.count != 0 else {
            emailTextField.attributedPlaceholder = NSAttributedString(string: "Please enter email",
                                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.red,
                                                                                          NSAttributedString.Key.font: UIFont(name: "Avenir", size: 18)!]
                    )
                    return
                }
                
                
                guard let password = passwordtextField.text, passwordtextField.text?.count != 0 else {
                    passwordtextField.attributedPlaceholder = NSAttributedString(string: "Please enter password",
                                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.red,
                                                                                          NSAttributedString.Key.font: UIFont(name: "Avenir", size: 18)!]
                    )
                    return
                }
        print(user)
        print(password)
        
        viewModel.login(username: emailTextField.text ?? "", password: passwordtextField.text ?? "")
    }
    
    private func configureConstraints() {
        
        let loginTitleLabelConstraints = [
            loginTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            loginTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let emailTextFieldConstraints = [
            emailTextField.topAnchor.constraint(equalTo: loginTitleLabel.bottomAnchor, constant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35),
            emailTextField.heightAnchor.constraint(equalToConstant: 45)
        ]
        
        let passwordtextFieldConstraints = [
            passwordtextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordtextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordtextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordtextField.heightAnchor.constraint(equalToConstant: 45)
        ]
        
        let loginButtonConstraints = [
            loginButton.topAnchor.constraint(equalTo: passwordtextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ]
        
        NSLayoutConstraint.activate(loginTitleLabelConstraints)
        NSLayoutConstraint.activate(emailTextFieldConstraints)
        NSLayoutConstraint.activate(passwordtextFieldConstraints)
        NSLayoutConstraint.activate(loginButtonConstraints)
    }
}

extension LoginViewController: LoginDelegate {
    
    func showError(error: Error) {
        print("showErrorsOnLoginFailure")
    }
    
    
    func navigateToHomeScreenOnLoginSuccess() {
        
        let vc  = DashboardViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showLoadingIndicator() {
        self.showLoading()
    }
    
    func hideLoadingIndicator() {
        self.hideLoading()
    }
    
    
}
