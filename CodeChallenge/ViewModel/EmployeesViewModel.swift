//
//  EmployeesViewModel.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.
//

import Foundation

protocol EmployeesDelegate: BaseDelegate {
    func navigateToHomeScreenOnLoginSuccess()
    func showErrorsOnLoginFailure()
}

class EmployeesViewModel {
    
    let service: ServiceCallsProtocol
    
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
                    
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    
                }
                 
            case .none:
                break
            }
        }
    }
    
}
