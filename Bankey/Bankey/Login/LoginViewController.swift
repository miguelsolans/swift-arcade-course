//
//  LoginViewController.swift
//  Bankey
//
//  Created by Miguel Solans on 10/05/2022.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView();
    
    let signInButton = UIButton(type: .system);
    let errorMessageLabel = UILabel();
    
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
        
        self.signInButton.translatesAutoresizingMaskIntoConstraints = false;
        self.signInButton.configuration = .filled();
        self.signInButton.configuration?.imagePadding = 8;
        self.signInButton.setTitle("Login", for: []);
        self.signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered);
        
        // Error Label
        self.errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false;
        self.errorMessageLabel.textColor = .red;
        self.errorMessageLabel.textAlignment = .center;
        self.errorMessageLabel.numberOfLines = 0;
        self.errorMessageLabel.text = "error failure"
        self.errorMessageLabel.isHidden = false;
    }
    
    private func layout() {
        self.view.addSubview(self.loginView)
        self.view.addSubview(self.signInButton)
        self.view.addSubview(self.errorMessageLabel)
        
        // LoginView Constraints
        NSLayoutConstraint.activate([
            self.loginView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1), // put 8 points off the side
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: self.loginView.trailingAnchor, multiplier: 1) // we use view.trailing anchor because of RTL
            
            
        ]);
        
        // Sign In Button Constraints
        NSLayoutConstraint.activate([
            self.signInButton.topAnchor.constraint(equalToSystemSpacingBelow: self.loginView.bottomAnchor, multiplier: 1),
            self.signInButton.leadingAnchor.constraint(equalTo: self.loginView.leadingAnchor),
            self.signInButton.trailingAnchor.constraint(equalTo: self.loginView.trailingAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 40)
        ]);
        
        // Error Label Constraints
        NSLayoutConstraint.activate([
            self.errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: self.signInButton.bottomAnchor, multiplier: 2),
            self.errorMessageLabel.leadingAnchor.constraint(equalTo: self.loginView.leadingAnchor),
            self.errorMessageLabel.trailingAnchor.constraint(equalTo: self.loginView.trailingAnchor),
        ]);
    }
}

// MARK: - Actions
extension LoginViewController {
    @objc func signInTapped() {
        print("Sign In Button Tapped");
    }
}

