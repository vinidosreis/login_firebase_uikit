//
//  AuthService.swift
//  LoginProject
//
//  Created by Vinícius dos Reis on 30/03/24.
//

import FirebaseAuth
import FirebaseFirestore

final class AuthService {
    
    public static let shared = AuthService()
    
    private init() {}
    
    public func signUp(with signUpRequest: SignUpRequest, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().createUser(withEmail: signUpRequest.email, password: signUpRequest.password) { result, error in
            if let error {
                completion(false, error)
                return
            }
            
            guard let user = result?.user else {
                completion(false, nil)
                return
            }
            
            let dataBase = Firestore.firestore()
            
            dataBase.collection("users").document(user.uid).setData([
                "username" : signUpRequest.username,
                "email" : signUpRequest.email,
            ]) { error in
                if let error {
                    completion(false, error)
                    return
                }
                
                completion(true, nil)
            }
        }
    }
    
    public func signIn(with signUpRequest: SignInRequest, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: signUpRequest.email, password: signUpRequest.password) { resullt, error in
            if let error = error {
                completion(error)
                return
            } else {
                completion(nil)
            }
        }
    }
    
    public func signOut(completion: @escaping (Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let error {
            completion(error)
        }
    }
}
