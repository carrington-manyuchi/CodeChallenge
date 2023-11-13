//
//  AdditionalVC.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/13.
//

import UIKit

class AdditionalVC: UIViewController {

        var name: String?
        var surname: String?
        var email: String?
        var placeOfBirth: String?
        
        
    
        let datePicker: UIDatePicker = {
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = .date
            datePicker.translatesAutoresizingMaskIntoConstraints = false
            return datePicker
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
            
            
            // Add a button to navigate to the next view controller
            
            nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
            view.backgroundColor = .white
            // Add datePicker to the view
            view.addSubview(datePicker)
                    
                    // Add nextButton to the view
                    view.addSubview(nextButton)
            
            // Set up constraints for the nextButton
        }
        
        @objc func nextButtonTapped() {
            let reviewVC = ReViewController()
            reviewVC.email = email
            reviewVC.placeOfBirth = placeOfBirth
            reviewVC.name = name
            reviewVC.surname = surname
            reviewVC.selectedDate = datePicker.date
            navigationController?.pushViewController(reviewVC, animated: true)
        }
    
    private func ConfigureConstraints() {
        let datePickerConstraints = [
            datePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
              datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ]
        
        let nextButtonConstraints = [
            nextButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 45),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
        ]
        
        NSLayoutConstraint.activate(nextButtonConstraints)
        NSLayoutConstraint.activate(datePickerConstraints   )
    }
}
