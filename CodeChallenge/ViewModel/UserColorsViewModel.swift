//
//  UserColorsViewModel.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.
//

import Foundation

protocol UserColorsDelegate: BaseDelegate {
    func dataReceived()
    
}


class UserColorsViewModel {
    
    var service: ServiceCallsProtocol
    var selectedColor: SingleColor?

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
            
            DispatchQueue.main.async {
                switch result {
                case .success(let colors):
                    
                    self?.userColors = colors.data
                   
                    if self?.selectedColor == nil {
                        self?.selectedColor = colors.data.first
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
   
