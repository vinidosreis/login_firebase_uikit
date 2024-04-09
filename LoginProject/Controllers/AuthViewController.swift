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
    func tryLogin() {
        AuthService.shared.signIn(with: SignInRequest(email: "teste123@gmail.com", password: "password123")) { [weak self] error in
            if let error {
                self?.showAlert(message: AuthError.signInFailed.localizedDescription)
            } else {
                print("logged!")
                self?.navigationController?.pushViewController(HomeViewController(), animated: true)
            }
        }
    }
    
    func tryRegister() {
        AuthService.shared.signUp(with: SignUpRequest(username: "", email: "", password: "")) { [weak self] result, error in
            if let error = error {
                self?.showAlert(message: AuthError.signUpFailed.localizedDescription)
            }
            print("athenticated!")
            self?.navigationController?.pushViewController(HomeViewController(), animated: true)
        }
    }
}
