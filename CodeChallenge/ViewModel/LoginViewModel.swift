//
//  UserViewModel.swift
//  CodeChallenge
//  Created by DA MAC M1 157 on 2023/11/10.
//

import Foundation

protocol LoginDelegate: BaseDelegate {
    func navigateToHomeScreenOnLoginSuccess()
    func showErrorsOnLoginFailure()
}

class LoginViewModel {
    
    let service: ServiceCallsProtocol
    
    private(set) var login: Login?
    private weak var delegate: LoginDelegate?
    
    init(delegate: LoginDelegate?, service: ServiceCallsProtocol) {
        self.service = service
        self.delegate = delegate
    }
    
    func login(username: String, password: String) {
        
        self.delegate?.showLoadingIndicator()
        DispatchQueue.global(qos: .background).async {  [weak self] in
            
            let result = self?.service.login(username: username, password: password)
            switch result {
            case .success(let login):
                self?.login = login
                DispatchQueue.main.async {
                    self?.delegate?.hideLoadingIndicator()
                    self?.delegate?.navigateToHomeScreenOnLoginSuccess()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.delegate?.hideLoadingIndicator()
                    self?.delegate?.showErrorsOnLoginFailure()
                }
                
            case .none:
                break
            }
            
        }
    }
    
}
