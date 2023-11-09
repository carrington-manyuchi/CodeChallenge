//
//  LoginVC.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/09.
//

import UIKit

class LoginVC: UIViewController {
    
    
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
        textField.borderStyle = .line
        textField.placeholder = "Enter email"
        return  textField
    }()
    
    
    private let passwordtextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.placeholder = "Enter password"
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        view.addSubview(loginTitleLabel)
    }
    
    
    



}
