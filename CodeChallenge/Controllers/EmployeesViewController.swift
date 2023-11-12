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
    
    private var viewModel: EmployeesViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        title = "LIST OF EMPLOYEES"
        navigationController?.navigationBar.backgroundColor = .blue
        setupUI()
        configureConstraints()        
        viewModel = EmployeesViewModel(delegate: self, service: ServiceCalls())
        viewModel.fetchEmployees()
               
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

extension EmployeesViewController: UITableViewDelegate, UITableViewDataSource, EmployeesDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.employees?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = employeesTableView.dequeueReusableCell(withIdentifier: EmployeesTableViewCell.identifier, for: indexPath) as? EmployeesTableViewCell else {
            return UITableViewCell()
        }
        
        if let employee = viewModel.employees?[indexPath.row] {
            cell.configure(with: employee)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DashboardViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func reloadTableViewWithData() {
            DispatchQueue.main.async {
                self.employeesTableView.reloadData()
            }
        }
    
    func showErrorsOnLoadingFailure() {
        print("I cant fetch data")
    }
    
    func showLoadingIndicator() {
    
    }
    
    func hideLoadingIndicator() {
    
    }
}



