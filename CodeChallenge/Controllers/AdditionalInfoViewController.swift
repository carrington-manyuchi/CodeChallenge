//
//  AdditionalInfoViewController.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.
//
/**
 I have to create a button and add it as a circle. Infront I will add a label.
 If  color changes the button color will change as well as the color label infront
 SHould works fine
 */

import UIKit

class AdditionalInfoViewController: BaseViewController {
    
    
    private let chooseGenderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose Gender"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let chooseGenderSegment: UISegmentedControl = {
        let genderArray = ["Female", "Male", "Other"]
        let segmentedControl = UISegmentedControl(items: genderArray)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.tintColor = .label
        return segmentedControl
    }()
    
    private let selectEmployeePrefferedColorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select Employee preferred color"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let selectColorCardView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.layer.borderColor = UIColor.systemGray5.cgColor
        myView.layer.borderWidth = 1
        return myView
    }()
    
    private let selectColorButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let colorNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Color Name"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 1
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
    
    private let addressTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.borderStyle = .roundedRect
        textField.placeholder = " Residential Address "
        return  textField
    }()
    
    private var viewModel:  UserColorsViewModel
    
    var selectedEmployee: Employee?

    
    init(viewModel: UserColorsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Additional Info"
        
        viewModel = UserColorsViewModel(delegate: self, service: ServiceCalls())
        viewModel.fetchColors()
        
        setupUI()
        configureConstraints()
        configureNextButton()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectColorCardViewTapped))
        selectColorCardView.addGestureRecognizer(tapGesture)
        selectColorCardView.isUserInteractionEnabled = true
    }
   

    
    @objc private func selectColorCardViewTapped() {
        let vc = ColorsViewController(viewModel: viewModel)
        navigationController?.pushViewController(vc, animated: true)
    }

    
    @objc internal override func didTapNextButton() {
        let vc = ReviewViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUI() {
        view.addSubview(chooseGenderLabel)
        view.addSubview(chooseGenderSegment)
        view.addSubview(selectEmployeePrefferedColorLabel)
        view.addSubview(selectColorCardView)
        selectColorCardView.addSubview(selectColorButton)
        selectColorCardView.addSubview(colorNameLabel)
        selectColorCardView.addSubview(nextImageView)
        view.addSubview(addressTextField)
    }
    
//    private func  configureView() {
//        colorNameLabel.text = viewModel.selectedColor?.name
//       // selectColorButton.backgroundColor = viewModel.selectedColor?.color
//    }
    
    private func configureView() {
        colorNameLabel.text = viewModel.selectedColor?.name
        
        let colorName = viewModel.selectedColor?.color
        selectColorButton.backgroundColor = UIColor(hex: ((Int("/(colorName.hex)" ) ?? 0  )))
        
    }
    


    private func configureConstraints() {
        
        let chooseGenderLabelConstraints = [
            chooseGenderLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            chooseGenderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        
        let chooseGenderSegmentConstraints = [
            chooseGenderSegment.topAnchor.constraint(equalTo: chooseGenderLabel.bottomAnchor, constant: 10),
            chooseGenderSegment.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseGenderSegment.heightAnchor.constraint(equalToConstant: 40),
            chooseGenderSegment.widthAnchor.constraint(equalToConstant: 250)
        ]
        
        let selectEmployeePrefferedColorLabelConstraints = [
            selectEmployeePrefferedColorLabel.topAnchor.constraint(equalTo: chooseGenderSegment.bottomAnchor, constant: 80),
            selectEmployeePrefferedColorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
        ]
        
        let selectColorCardViewConstraints = [
            selectColorCardView.topAnchor.constraint(equalTo: selectEmployeePrefferedColorLabel.bottomAnchor, constant: 5),
            selectColorCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectColorCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ]
        
        let nextImageViewConstraints = [
            nextImageView.trailingAnchor.constraint(equalTo: selectColorCardView.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            nextImageView.centerYAnchor.constraint(equalTo: selectColorCardView.centerYAnchor),
        ]
        
        let selectColorButtonConstraints = [
            selectColorButton.topAnchor.constraint(equalTo: selectColorCardView.topAnchor, constant: 20),
            selectColorButton.leadingAnchor.constraint(equalTo: selectColorCardView.leadingAnchor, constant: 30),
            selectColorButton.bottomAnchor.constraint(equalTo: selectColorCardView.bottomAnchor, constant: -20),
            selectColorButton.heightAnchor.constraint(equalToConstant: 30),
            selectColorButton.widthAnchor.constraint(equalToConstant: 30)
        ]
        
        let colorNameLabelConstraints = [
            //colorNameLabel.topAnchor.constraint(equalTo: selectColorButton.topAnchor),
            colorNameLabel.leadingAnchor.constraint(equalTo: selectColorButton.trailingAnchor, constant: 10),
            colorNameLabel.centerYAnchor.constraint(equalTo: selectColorButton.centerYAnchor),
        ]
        
        let addressTextFieldConstraints = [
            addressTextField.topAnchor.constraint(equalTo: selectColorCardView.bottomAnchor, constant: 50),
            addressTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            addressTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            addressTextField.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(chooseGenderLabelConstraints)
        NSLayoutConstraint.activate(chooseGenderSegmentConstraints)
        NSLayoutConstraint.activate(selectEmployeePrefferedColorLabelConstraints)
        NSLayoutConstraint.activate(selectColorCardViewConstraints)
        NSLayoutConstraint.activate(selectColorButtonConstraints)
        NSLayoutConstraint.activate(colorNameLabelConstraints)
        NSLayoutConstraint.activate(nextImageViewConstraints)
        NSLayoutConstraint.activate(addressTextFieldConstraints)
    }
}




extension AdditionalInfoViewController: UserColorsDelegate {
    func dataReceived() {
        configureView()
    }
    
    
    
    
    
    func showLoadingIndicator() {
        
    }
    
    func hideLoadingIndicator() {
        
    }
    
    func showError(error: Error) {
        
    }
    
    
}


