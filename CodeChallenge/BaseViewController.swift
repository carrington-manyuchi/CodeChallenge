//
//  BaseViewController.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBarBackButton()
        configureNavigationaBar()
        
    }
    
    func configureNavigationBarBackButton() {
        let backButtonImage = UIImage(systemName: "chevron.backward")
        navigationController?.navigationBar.backIndicatorImage = backButtonImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        navigationController?.navigationBar.barTintColor = .white
        
        UINavigationBar.appearance().barTintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
    }
    
    
    func configureNavigationaBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .blue
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
            
        ]
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.shadowImage = UIImage()

        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .blue
            appearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
            appearance.shadowImage = UIImage()
            
            navigationController?.navigationBar.standardAppearance = appearance;
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }
    }
    
    
    
    
}
