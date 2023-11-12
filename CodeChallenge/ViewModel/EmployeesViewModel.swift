//
//  EmployeesViewModel.swift
//  CodeChallenge
//  Created by DA MAC M1 157 on 2023/11/10.

import Foundation

protocol EmployeesDelegate: BaseDelegate {
    func reloadTableViewWithData()
    func showErrorsOnLoadingFailure()
}

class EmployeesViewModel {
    
    var service: ServiceCallsProtocol
    
    private(set) var employees: [Employee]?
    private weak var delegate: EmployeesDelegate?
    
    init(delegate: EmployeesDelegate?, service: ServiceCallsProtocol) {
        self.service = service
        self.delegate = delegate
    }
    
    func fetchEmployees() {
        DispatchQueue.global(qos: .background).async {  [weak self] in            
            let result = self?.service.fetchEmployees()
            switch result {
            case .success(let data):
                self?.employees = data.data
                DispatchQueue.main.async {
                    self?.delegate?.reloadTableViewWithData()
                }
            case .failure(let error):
               // self?.service = error as! any ServiceCallsProtocol
                DispatchQueue.main.async {
                    self?.delegate?.showErrorsOnLoadingFailure()
                    print(error)
                }
                 
            case .none:
                break
            }
        }
    }
    
}
