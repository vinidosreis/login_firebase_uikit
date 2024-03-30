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
    }
}
