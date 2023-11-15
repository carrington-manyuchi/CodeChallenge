//
//  EmployeesViewModel.swift
//  CodeChallenge
//  Created by DA MAC M1 157 on 2023/11/10.

import Foundation

protocol EmployeesDelegate: BaseDelegate {
    func dataReceived()
}

class EmployeesViewModel {
    
    var service: ServiceCallsProtocol
    var selectedEmployee: Employee?
    
    private(set) var employees: [Employee]?
    private weak var delegate: EmployeesDelegate?
    
    init(delegate: EmployeesDelegate?, service: ServiceCallsProtocol) {
        self.service = service
        self.delegate = delegate
    }
    
    func fetchEmployees() {
        
        self.delegate?.showLoadingIndicator()
        
        DispatchQueue.global(qos: .background).async {  [weak self] in
            
            let result = self?.service.fetchEmployees()
            
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    
                    self?.employees = data.data
                    if self?.selectedEmployee == nil {
                        self?.selectedEmployee = data.data?.first
                    }
                    self?.delegate?.hideLoadingIndicator()
                    self?.delegate?.dataReceived()
                    
                case .failure(let error):
                    
                        self?.delegate?.hideLoadingIndicator()
                        self?.delegate?.showError(error: error)
                        print(error)
                
                    
                case .none:
                    break
                }
            }
        }
        
    }
}
