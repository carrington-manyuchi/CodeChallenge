//
//  ReviewViewModel.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/15.
//

import Foundation

protocol ReviewDelegate: BaseDelegate {
     func showSuccessScreen()
}

class ReviewViewModel {
    
    let service: ServiceCallsProtocol
    
    
    private weak var delegate: ReviewDelegate?
    
    private var userInfo: UserInfo?
    
    init(delegate: ReviewDelegate?, service: ServiceCallsProtocol,  userInfo: UserInfo?) {
        self.service = service
        self.delegate = delegate
        self.userInfo = userInfo
    }
    
    func submit() {
        self.delegate?.showLoadingIndicator()
        
        /**It performs the actual login operation asynchronously in the background using Grand Central Dispatch (GCD)**/
        DispatchQueue.global(qos: .background).async {  [weak self] in
            guard let userInfo = self?.userInfo else {
                return
            }
            let result = self?.service.updateUser(user: userInfo)
            
            
            /**switches on the result of the login operation and updates the UI on the main thread based on success or failure**/
            switch result {
            case .success(let userInfo):
                DispatchQueue.main.async {
                    self?.delegate?.hideLoadingIndicator()
                    self?.delegate?.showSuccessScreen()
                    print(userInfo)
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
