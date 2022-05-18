//
//  LoginViewController.swift
//  Bankey
//
//  Created by Miguel Solans on 10/05/2022.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView();
    
    let appTitleLabel = UILabel();
    let appDescriptionLabel = UILabel();
    let stackView = UIStackView();
    
    let signInButton = UIButton(type: .system);
    let errorMessageLabel = UILabel();
    
    var username: String?  {
        return loginView.usernameTextField.text;
    }
    var password: String? {
        return loginView.passwordTextField.text;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.style()
        self.layout();
        
    }

}

extension LoginViewController {
    private func style() {
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false;
        self.stackView.axis = .vertical;
        self.stackView.spacing = 2;
        
        self.appTitleLabel.text = "Bankey";
        self.appTitleLabel.textAlignment = .center;
        self.appTitleLabel.numberOfLines = 0;
        self.appTitleLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .semibold)
        
        self.appDescriptionLabel.text = "Your premium source for all \n things banking!"
        self.appDescriptionLabel.textAlignment = .center;
        self.appDescriptionLabel.numberOfLines = 0;
        self.appDescriptionLabel.lineBreakMode = .byWordWrapping;
        
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
        self.errorMessageLabel.isHidden = true;
    }
    
    private func layout() {
        self.view.addSubview(self.stackView);
        self.view.addSubview(self.loginView)
        self.view.addSubview(self.signInButton)
        self.view.addSubview(self.errorMessageLabel)
        
        // App Title and Description
        self.stackView.addArrangedSubview(self.appTitleLabel);
        self.stackView.addArrangedSubview(self.appDescriptionLabel);
        
        NSLayoutConstraint.activate([
            self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.stackView.heightAnchor.constraint(equalToConstant: 80),
            self.stackView.bottomAnchor.constraint(equalToSystemSpacingBelow: self.loginView.topAnchor, multiplier: -4)
        ]);
        
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
        
        errorMessageLabel.isHidden = true;
        self.login();
        
    }
    
    private func login() {
        guard let username = self.username, let password = self.password else {
            assertionFailure("Username / Password should never be nil");
            return
        }
        
        if username.isEmpty || password.isEmpty {
            self.configureView(withMessage: "Username / Password cannot be blank")
        }
        
        if username == "Miguel" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true;
        } else {
            self.configureView(withMessage: "Incorrect Username / Password");
        }
    }
    
    private func configureView(withMessage message: String) {
        self.errorMessageLabel.isHidden = false;
        self.errorMessageLabel.text = message;
    }
}

