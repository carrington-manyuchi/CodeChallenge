//
//  ColorsTableViewCell.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/11.
/***TableViewCell: A specialized type of view that manages the content of a single table row
 **Defines a blueprint of how a single cell should look like*/

import UIKit

class ColorsTableViewCell: UITableViewCell {
            
     let cardView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.layer.borderColor = UIColor.systemGray5.cgColor
        myView.layer.borderWidth = 1
        return myView
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
    
     let colorNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Color Name"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    public static let identifier = "ColorsTableViewCell"

    /** initializing views */
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(cardView)
       // cardView.addSubview(selectColorButton)
        cardView.addSubview(colorNameLabel)
        cardView.addSubview(colorView)
    }
    
    func configure(with color: SingleColor) {
        colorNameLabel.text = color.name
        colorView.backgroundColor = UIColor(hex: color.color)
    }
    
    private func configureConstraints() {
        let cardViewConstraints = [
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ]
        
        let colorViewButtonConstraints = [
            colorView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            colorView.leadingAnchor.constraint(equalTo: cardView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            colorView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
            colorView.heightAnchor.constraint(equalToConstant: 30),
            colorView.widthAnchor.constraint(equalToConstant: 30)
        ]
        
        let colorNameLabelConstraints = [
            colorNameLabel.leadingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: 20),
            colorNameLabel.centerYAnchor.constraint(equalTo: colorView.centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(cardViewConstraints)
       // NSLayoutConstraint.activate(selectColorButtonConstraints)
        NSLayoutConstraint.activate(colorNameLabelConstraints)
        NSLayoutConstraint.activate(colorViewButtonConstraints)
    }
    
}

extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            return nil
        }

        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}



