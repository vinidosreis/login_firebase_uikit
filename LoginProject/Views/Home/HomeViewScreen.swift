//
//  HomeViewScreen.swift
//  LoginProject
//
//  Created by Vinícius dos Reis on 30/03/24.
//

import UIKit

final class HomeViewScreen: UIView {
    
    lazy var label = UILabel().with {
        $0.text = "Logged In!"
        $0.font = .systemFont(ofSize: 24)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        nil
    }
    
}

extension HomeViewScreen: ViewCode {
    func setupHierarchy() {
        addSubview(label)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func additionalConfig() {
        backgroundColor = .white
    }
}
