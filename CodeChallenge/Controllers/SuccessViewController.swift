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
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    private let successMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse est leo, vehicula eu eleifend non, auctor ut arcu, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse est leo, vehicula eu eleifend non, auctor ut arcu"
        label.font = .systemFont(ofSize: 14)
        label.sizeToFit()
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
