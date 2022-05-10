//
//  LoginViewController.swift
//  Bankey
//
//  Created by Miguel Solans on 10/05/2022.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.style()
        self.layout();
        
    }


}

extension LoginViewController {
    private func style() {
        // Make the view ready for autolayout
        self.loginView.translatesAutoresizingMaskIntoConstraints = false;
    }
    
    private func layout() {
        self.view.addSubview(self.loginView)
        
        NSLayoutConstraint.activate([
            self.loginView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1), // put 8 points off the side
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: self.loginView.trailingAnchor, multiplier: 10) // come after loginview trailing anchor
        ]);
    }
}

