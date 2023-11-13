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
    
     private var viewModel: EmployeesViewModel
    
    
    init(viewModel: EmployeesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LIST OF EMPLOYEES"
        setupUI()
        configureConstraints()
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
        self.viewModel.selectedEmployee = viewModel.employees?[indexPath.row]
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
}



