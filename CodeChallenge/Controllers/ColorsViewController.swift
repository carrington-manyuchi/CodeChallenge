//
//  ColorsViewController.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/11.
//

import UIKit

class ColorsViewController: BaseViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.register(ColorsTableViewCell.self, forCellReuseIdentifier: ColorsTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private var viewModel:  UserColorsViewModel
    
    init(viewModel: UserColorsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureConstraints()
    }
    
    private func setupUI() {
        title = "Select Preferred Color"
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    private func configureConstraints() {
        let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
    }
}

extension ColorsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userColors?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ColorsTableViewCell.identifier, for: indexPath) as? ColorsTableViewCell else {
            return UITableViewCell()
        }
        
        if let color = viewModel.userColors?[indexPath.row] {
            cell.configure(with: color)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.selectedColor = viewModel.userColors?[indexPath.row]
        self.navigationController?.popViewController(animated: true)
    }
}
