//
//  AppDelegate.swift
//  LoginProject
//
//  Created by Vinícius dos Reis on 27/03/24.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: AuthViewController())
        window?.makeKeyAndVisible()
        
        FirebaseApp.configure()
        
        return true
    }
}
