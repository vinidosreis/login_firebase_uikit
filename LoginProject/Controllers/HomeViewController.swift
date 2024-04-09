//
//  HomeViewController.swift
//  LoginProject
//
//  Created by Vinícius dos Reis on 30/03/24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var homeViewScreen: HomeViewScreen = {
        HomeViewScreen()
    }()
    
    override func loadView() {
        super.loadView()
        view = homeViewScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        homeViewScreen.delegate = self
    }
}

extension HomeViewController: HomeViewScreenDelegate {
    func doLogout() {
        AuthService.shared.signOut { [weak self] error in
            if let error {
                self?.showAlert(message: AuthError.signOutFailed.localizedDescription)
            } else {
                print("logout!")
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
}
