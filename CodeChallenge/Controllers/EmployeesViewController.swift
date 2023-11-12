//
//  EmployeesViewController.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/09.
//

import UIKit

class EmployeesViewController: BaseViewController {
    
    private let employeesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(EmployeesTableViewCell.self, forCellReuseIdentifier: EmployeesTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        title = "LIST OF EMPLOYEES"
        navigationController?.navigationBar.backgroundColor = .blue
        setupUI()
        configureConstraints()
        configureNextButton()
    }
    
    private func setupUI() {
        view.addSubview(employeesTableView)
        employeesTableView.delegate = self
        employeesTableView.dataSource = self
    }
    
    private func configureConstraints() {
        let employeesTableViewConstraints = [
            employeesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            employeesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            employeesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            employeesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(employeesTableViewConstraints)
    }
}

extension EmployeesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeesTableViewCell.identifier, for: indexPath) as? EmployeesTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DashboardViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
