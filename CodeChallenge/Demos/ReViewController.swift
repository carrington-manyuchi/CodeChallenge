//
//  ReViewController.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/13.
//

import UIKit

class ReViewController: UIViewController {

        var email: String?
        var placeOfBirth: String?
        var name: String?
        var surname: String?
        var selectedDate: Date?
    
        let reviewLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .white
                    
             // Add reviewLabel to the view
             view.addSubview(reviewLabel)
                    
            
            // Display collected data in reviewLabel
             reviewLabel.text = """
                    Email: \(email ?? "")
                    Place of Birth: \(placeOfBirth ?? "")
                    Name: \(name ?? "")
                    Surname: \(surname ?? "")
                    Selected Date: \(formattedDate(selectedDate) ?? "")
                    """
        }
    
    func formattedDate(_ date: Date?) -> String? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM dd, yyyy"
            return date.map { dateFormatter.string(from: $0) }
        }
    
    }
