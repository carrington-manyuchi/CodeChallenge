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
    
    var placeOfBirth: String?
    var selectedDate: Date?
    var email: String?
    var name: String?
    var image: UIImage?
    
    private let chooseGenderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose Gender"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let colorView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.layer.borderColor = UIColor.systemGray5.cgColor
        myView.layer.borderWidth = 1
        myView.layer.cornerRadius = 15
        myView.backgroundColor = .clear
        return myView
    }()
    
    private let chooseGenderSegment: UISegmentedControl = {
        let genderArray = ["Male", "Female", "Other" ]
        let segmentedControl = UISegmentedControl(items: genderArray)
        segmentedControl.selectedSegmentIndex = 0 // Default selection
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.tintColor = .label
       // segmentedControl.selectedSegmentTintColor = UIColorFromRGB(rgbValue: 0x39A7FF)
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
    var userInfo: UserInfo
    
    init(viewModel: UserColorsViewModel, userInfo: UserInfo) {
        self.viewModel = viewModel
        self.userInfo = userInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Additional Info"
        chooseGenderSegment.selectedSegmentTintColor = UIColorFromRGB(rgbValue: 0x39A7FF)
        
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
        self.userInfo.personalDetails?.gender = chooseGenderSegment.titleForSegment(at: chooseGenderSegment.selectedSegmentIndex)
        self.userInfo.additionalInformation?.residentialAddress = addressTextField.text
        self.userInfo.additionalInformation?.preferredColor = colorNameLabel.text
        let vc = ReviewViewController(userInfo: self.userInfo)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUI() {
        view.addSubview(chooseGenderLabel)
        view.addSubview(chooseGenderSegment)
        view.addSubview(selectEmployeePrefferedColorLabel)
        view.addSubview(selectColorCardView)
        selectColorCardView.addSubview(colorView)
        
        selectColorCardView.addSubview(colorNameLabel)
        selectColorCardView.addSubview(nextImageView)
        view.addSubview(addressTextField)
    }
    
    private func configureView() {
        colorNameLabel.text = viewModel.selectedColor?.name
        let color = viewModel.selectedColor?.color
        colorView.backgroundColor = UIColor(hex: color ?? "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
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
        
        let colorViewConstraints = [
            colorView.topAnchor.constraint(equalTo: selectColorCardView.topAnchor, constant: 20),
            colorView.leadingAnchor.constraint(equalTo: selectColorCardView.leadingAnchor, constant: 30),
            colorView.bottomAnchor.constraint(equalTo: selectColorCardView.bottomAnchor, constant: -20),
            colorView.heightAnchor.constraint(equalToConstant: 30),
            colorView.widthAnchor.constraint(equalToConstant: 30)
        ]
        
        let colorNameLabelConstraints = [
            colorNameLabel.leadingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: 10),
            colorNameLabel.centerYAnchor.constraint(equalTo: colorView.centerYAnchor),
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
        NSLayoutConstraint.activate(colorNameLabelConstraints)
        NSLayoutConstraint.activate(nextImageViewConstraints)
        NSLayoutConstraint.activate(addressTextFieldConstraints)
        NSLayoutConstraint.activate(colorViewConstraints
        )
    }
}

extension AdditionalInfoViewController: UserColorsDelegate {
    func dataReceived() {
        configureView()
    }
    
    func showLoadingIndicator() {
        self.showLoading()
    }
    
    func hideLoadingIndicator() {
        self.hideLoading()
    }
    
    func showError(error: Error) {
        
    }
}


