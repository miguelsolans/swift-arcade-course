//
//  AppDelegate.swift
//  Bankey
//
//  Created by Miguel Solans on 10/05/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds);
        window?.makeKeyAndVisible();
        window?.backgroundColor = .systemBackground;
        window?.rootViewController = OnboardingViewController();
        
        return true
    }
    
}

