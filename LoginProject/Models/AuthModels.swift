//
//  AuthModels.swift
//  LoginProject
//
//  Created by Vinícius dos Reis on 30/03/24.
//

struct SignUpRequest {
    let username: String
    let email: String
    let password: String
}

struct SignInRequest {
    let email: String
    let password: String
}

enum AuthError: Error {
    case signInFailed
    case signUpFailed
    case signOutFailed
    
    var localizedDescription: String {
        switch self {
        case .signInFailed:
            return "Sign In Failed\n Try again later"
        case .signUpFailed:
            return "Sign Up Failed\n Try again later"
        case .signOutFailed:
            return "Sign Out Failed\n Try again later"
        }
    }
}
