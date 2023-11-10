//
//  AdditionalInfoViewController.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.
//
 
import UIKit

class AdditionalInfoViewController: UIViewController {
    
    
    private let chooseGenderLabel: UISegmentedControl = {
        let genderArray = ["Female", "Male", "Other"]
        let segmentedControl = UISegmentedControl(items: genderArray)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.tintColor = .label
        return segmentedControl
    }()
    
    private let preferredColorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select Employee preferred colour"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let selectColorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "dot.circle"), for: .normal)
        button.setImage(UIImage(systemName: "dot.circle.fill"), for: .selected)
        return button
    }()
    
    private let colorNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Color Name"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let addressTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.borderStyle = .line
        textField.placeholder = " Residential Address "
        return  textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextButtonTapped))

        setupUI()
        configureConstraints()
    }
    
    @objc private func nextButtonTapped() {
        let vc = ReviewViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(chooseGenderLabel)
        view.addSubview(selectColorButton)
        view.addSubview(colorNameLabel)
        view.addSubview(addressTextField)
    }

    private func configureConstraints() {
        
        let chooseGenderConstraints = [
            chooseGenderLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            chooseGenderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseGenderLabel.heightAnchor.constraint(equalToConstant: 50),
            chooseGenderLabel.widthAnchor.constraint(equalToConstant: 250)
        ]
        
        let selectColorButtonConstraints = [
            selectColorButton.topAnchor.constraint(equalTo: chooseGenderLabel.bottomAnchor, constant: 40),
            selectColorButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            selectColorButton.heightAnchor.constraint(equalToConstant: 40),
            selectColorButton.widthAnchor.constraint(equalToConstant: 40)
        ]
        
        let colorNameLabelConstraints = [
            //colorNameLabel.topAnchor.constraint(equalTo: selectColorButton.topAnchor),
            colorNameLabel.leadingAnchor.constraint(equalTo: selectColorButton.trailingAnchor, constant: 10),
            colorNameLabel.centerYAnchor.constraint(equalTo: selectColorButton.centerYAnchor),
        ]
        
        let addressTextFieldConstraints = [
            addressTextField.topAnchor.constraint(equalTo: colorNameLabel.bottomAnchor, constant: 50),
            addressTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            addressTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            addressTextField.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(chooseGenderConstraints)
        NSLayoutConstraint.activate(selectColorButtonConstraints)
        NSLayoutConstraint.activate(colorNameLabelConstraints)
        NSLayoutConstraint.activate(addressTextFieldConstraints)
    }
}
