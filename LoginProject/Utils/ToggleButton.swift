//
//  ToggleButton.swift
//  LoginProject
//
//  Created by Vinícius dos Reis on 29/03/24.
//

import UIKit

final class ToggleButton: UIView {
    
    var signInAction: (() -> Void)?
    var signUpAction: (() -> Void)?
    
    lazy var segmentedControl = UISegmentedControl(items: ["Sign In", "Sign Up"]).with {
        $0.selectedSegmentIndex = 0
        $0.backgroundColor = .white
        $0.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        $0.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            signInAction?()
        case 1:
            signUpAction?()
        default:
            break
        }
    }
}

extension ToggleButton: ViewCode {
    func setupHierarchy() {
        addSubview(segmentedControl)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor),
            segmentedControl.topAnchor.constraint(equalTo: topAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func additionalConfig() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
