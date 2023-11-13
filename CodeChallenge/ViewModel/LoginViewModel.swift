//
//  UserViewModel.swift
//  CodeChallenge
//  Created by DA MAC M1 157 on 2023/11/10.
/**
 ***This ViewModel handles the logic for the login process,
 *interacts with a service and notifies a delegate
 *about the results or updates in the login process.
 **/

import Foundation

protocol LoginDelegate: BaseDelegate {
    func navigateToHomeScreenOnLoginSuccess()
}

class LoginViewModel {
    
    let service: ServiceCallsProtocol
    
    private(set) var login: Login?
    private weak var delegate: LoginDelegate?
    
    init(delegate: LoginDelegate?, service: ServiceCallsProtocol) {
        self.service = service
        self.delegate = delegate
    }
    
    
    /**responsible for initiating the login process.**/
    func login(username: String, password: String) {
        
        /**It notifies the delegate to show a loading indicator.**/
        self.delegate?.showLoadingIndicator()
        
        /**It performs the actual login operation asynchronously in the background using Grand Central Dispatch (GCD)**/
        DispatchQueue.global(qos: .background).async {  [weak self] in
            
            let result = self?.service.login(username: username, password: password)
            
            /**switches on the result of the login operation and updates the UI on the main thread based on success or failure**/
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
                    self?.delegate?.showError(error: error)
                    print(error)
                }
                
            case .none:
                break
            }
            
        }
    }
    
}
