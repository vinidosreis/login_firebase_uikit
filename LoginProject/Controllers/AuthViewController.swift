//
//  AuthViewController.swift
//  LoginProject
//
//  Created by Vinícius dos Reis on 27/03/24.
//

import UIKit

final class AuthViewController: UIViewController {
    
    private lazy var authViewScreen: AuthViewScreen = {
        AuthViewScreen()
    }()
    
    override func loadView() {
        super.loadView()
        view = authViewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authViewScreen.delegate = self
    }
}

extension AuthViewController: AuthViewScreenDelegate {
    func pushToHomeView() {
        print("teste")
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
}
