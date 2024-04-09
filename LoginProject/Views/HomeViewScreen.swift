//
//  HomeViewScreen.swift
//  LoginProject
//
//  Created by Vinícius dos Reis on 30/03/24.
//

import UIKit

protocol HomeViewScreenDelegate: AnyObject {
    func doLogout()
}

final class HomeViewScreen: UIView {
    
    weak var delegate: HomeViewScreenDelegate?
    
    lazy var label = UILabel().with {
        $0.text = "Logged In!"
        $0.font = .systemFont(ofSize: 24)
    }
    
    lazy var logoutButton = UIButton().with {
        $0.setTitle("   Logout  ", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 24)
        $0.backgroundColor = .black
        $0.addAction(
            UIAction { [weak self] _ in
                self?.tryLogout() } , for: .primaryActionTriggered )
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        nil
    }
    
    private func tryLogout() {
        delegate?.doLogout()
    }
}

extension HomeViewScreen: ViewCode {
    func setupHierarchy() {
        addSubview(label)
        addSubview(logoutButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            logoutButton.topAnchor.constraint(equalTo: label.bottomAnchor
                                              ,constant: 50),
            logoutButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
    }
    
    func additionalConfig() {
        backgroundColor = .white
    }
}
