//
//  AppDelegate.swift
//  Bankey
//
//  Created by Miguel Solans on 10/05/2022.
//

import UIKit


let appColor: UIColor = .systemTeal;

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let loginViewController = LoginViewController();
    let onboardingContainerViewController = OnboardingContainerViewController();
    let mainViewController = MainViewController();
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds);
        window?.makeKeyAndVisible();
        window?.backgroundColor = .systemBackground;
        
        let vc = loginViewController;
        loginViewController.delegate = self;
        onboardingContainerViewController.delegate = self;
        vc.setStatusBar();
        
        UINavigationBar.appearance().isTranslucent = false;
        UINavigationBar.appearance().backgroundColor = appColor;
        
        window?.rootViewController = vc;
        
        registerForNotifications();
        
        return true
    }
    
    
    func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: .logout, object: nil);
    }
}


extension AppDelegate : LoginViewControllerDelegate {
    func didLogin() {
        print("AppDelegate - Did Login")
        
        if(!LocaleState.hasOnboarded) {
            self.setRootViewController(onboardingContainerViewController);
        } else {
            self.setRootViewController(mainViewController)
        }
        
        
    }
}

extension AppDelegate : OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        print("AppDelegate - Did Finish Onboarding")
        
        LocaleState.hasOnboarded = true;
        self.setRootViewController(mainViewController)
    }
}

extension AppDelegate {
    func setRootViewController(_ viewController: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = viewController;
            self.window?.makeKeyAndVisible();
            return;
        }
        
        window.rootViewController = viewController;
        window.makeKeyAndVisible();
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil);
    }
}

extension AppDelegate : LogoutDelegate {
    @objc func didLogout() {
        print("AppDelegate - didLogout")
        
        self.setRootViewController(loginViewController)
    }
}


