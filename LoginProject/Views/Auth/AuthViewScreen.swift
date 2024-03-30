//
//  ViewScreen.swift
//  LoginProject
//
//  Created by Vinícius dos Reis on 28/03/24.
//

import UIKit

protocol AuthViewScreenDelegate: AnyObject {
    func pushToHomeView()
}

final class AuthViewScreen : UIView {
    
    weak var delegate: AuthViewScreenDelegate?
    
    lazy var logoView = UIImageView(image: UIImage(named: "folder_x")).with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var toggleButton = ToggleButton().with {
        $0.signInAction = { self.setupSignInScreen() }
        $0.signUpAction = { self.setupSignUpScreen() }
    }
    
    lazy var userTextField = UITextField().with {
        $0.placeholder = "  email"
        $0.backgroundColor = .white
        $0.autocapitalizationType = .none
        $0.layer.cornerRadius = 10
    }
    
    lazy var passwordTextField = UITextField().with {
        $0.placeholder = "  password"
        $0.backgroundColor = .white
        $0.autocapitalizationType = .none
        $0.layer.cornerRadius = 10
    }
    
    lazy var nameTextField = UITextField().with {
        $0.placeholder = "  name"
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    lazy var infoLabel = UILabel().with {
        $0.text = "▪ 8 minimum character        ▪ 1 uppercase\n▪ 1 special character            ▪ 1 number"
        $0.numberOfLines = 0
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 14)
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    lazy var authButton = UIButton().with {
        $0.setTitle("Sign In", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true // garante que as subcamadas (como sombras) sejam cortadas na forma do botão
        $0.addTarget(self, action: #selector(authButtonTapped), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        nil
    }
    
    override func layoutSubviews() {
        applyGradient(colors: [.systemIndigo, .systemBlue, .systemCyan])
    }
    
    @objc private func authButtonTapped() {
        delegate?.pushToHomeView()
    }
}

extension AuthViewScreen {
    func setupSignUpScreen() {
        authButton.removeFromSuperview()
        authButton.setTitle("Sign Up", for: .normal)
        
        addSubview(nameTextField)
        addSubview(infoLabel)
        addSubview(authButton)

        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            infoLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 35),
            infoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            infoLabel.heightAnchor.constraint(equalToConstant: 50),
            
            authButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            authButton.widthAnchor.constraint(equalToConstant: 160),
            authButton.heightAnchor.constraint(equalToConstant: 40),
            authButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 40)
            
        ])
    }
    
    func  setupSignInScreen() {
        authButton.removeFromSuperview()
        nameTextField.removeFromSuperview()
        infoLabel.removeFromSuperview()
        
        authButton.setTitle("Sign In", for: .normal)
        
        addSubview(authButton)
       
        NSLayoutConstraint.activate([
            authButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            authButton.widthAnchor.constraint(equalToConstant: 160),
            authButton.heightAnchor.constraint(equalToConstant: 40),
            authButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50)
            
        ])
    }
}

extension AuthViewScreen: ViewCode {
    func setupHierarchy() {
        addSubview(logoView)
        addSubview(toggleButton)
        addSubview(userTextField)
        addSubview(passwordTextField)
        addSubview(authButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            logoView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 95),
            logoView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -95),
            logoView.heightAnchor.constraint(equalToConstant: 160),
            
            toggleButton.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 70),
            toggleButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            toggleButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
            toggleButton.heightAnchor.constraint(equalToConstant: 40),
            
            userTextField.topAnchor.constraint(equalTo: toggleButton.bottomAnchor, constant: 35),
            userTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            userTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            userTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 15),
            
            authButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            authButton.widthAnchor.constraint(equalToConstant: 160),
            authButton.heightAnchor.constraint(equalToConstant: 40),
            authButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40)
        ])
    }
}
