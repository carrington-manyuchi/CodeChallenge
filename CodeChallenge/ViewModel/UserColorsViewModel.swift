//
//  UserColorsViewModel.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.
//

import Foundation

protocol UserColorsDelegate: BaseDelegate {
    func navigateToHomeScreenOnLoginSuccess()
    
}


class UserColorsViewModel {
    
    let service: ServiceCallsProtocol

    private(set)  var userColors: [SingleColor]?
    private weak var delegate: UserColorsDelegate?
    
    init(delegate: UserColorsDelegate?, service: ServiceCallsProtocol) {
        self.service = service
        self.delegate = delegate
    }
    
    func fetchColors() {
        
        self.delegate?.showLoadingIndicator()
        DispatchQueue.global(qos: .background).async {  [weak self] in
            let result = self?.service.fetchColors()
            switch result {
            case .success(let colors):
                self?.userColors = colors.data
                DispatchQueue.main.async {
                    self?.delegate?.hideLoadingIndicator()
                    
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.delegate?.hideLoadingIndicator()
                    print(error)
                }
                
            case .none:
                break
            }
        }
    }
    
}
