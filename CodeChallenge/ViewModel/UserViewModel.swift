//
//  UserViewModel.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.
//

import Foundation



class UserViewModel {
    
    let service: ServiceCallsProtocol
    
    private(set) var login: Login?
    private(set) var employees: [Employee]?
    private(set)  var userColors: [SingleColor]?
    
    init(service: ServiceCallsProtocol) {
        self.service = service
    }
    
    func login(username: String, password: String) {
        DispatchQueue.global(qos: .background).async {  [weak self] in
            
            
            let result = self?.service.login(username: username, password: password)
            switch result {
            case .success(let login):
                self?.login = login
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
    
    func fetchColors() {
        DispatchQueue.global(qos: .background).async {  [weak self] in
            let result = self?.service.fetchColors()
            switch result {
            case .success(let colors):
                self?.userColors = colors.data
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
