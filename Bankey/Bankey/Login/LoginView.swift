//
//  LoginView.swift
//  Bankey
//
//  Created by Miguel Solans on 10/05/2022.
//

import UIKit

class LoginView: UIView {
    
    let stackView = UIStackView();
    let dividerView = UIView();
    let usernameTextField = UITextField();
    let passwordTextField = UITextField();
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        
        self.style()
        self.layout();
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    /*
     // By now, the view already knows its size, therefore we don't need to override this property
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
    */
}

extension LoginView {
    
    func style() {
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.backgroundColor = .secondarySystemBackground;
        
        self.usernameTextField.translatesAutoresizingMaskIntoConstraints = false;
        self.usernameTextField.placeholder = "Username"
        self.usernameTextField.delegate = self;
        
        self.passwordTextField.translatesAutoresizingMaskIntoConstraints = false;
        self.passwordTextField.placeholder = "Password";
        self.passwordTextField.isSecureTextEntry = true
        self.passwordTextField.delegate = self;
        
        // StackView Setup
        self.stackView.translatesAutoresizingMaskIntoConstraints = false;
        self.stackView.axis = .vertical;
        self.stackView.spacing = 8;
        
        // Divider Setup
        self.dividerView.translatesAutoresizingMaskIntoConstraints = false;
        self.dividerView.backgroundColor = .secondarySystemFill;
        
        // Rounded Corners
        self.layer.cornerRadius = 5;
        self.clipsToBounds = true;
        
    }
    
    func layout() {
        
        /*
        self.addSubview(self.usernameTextField);
        NSLayoutConstraint.activate([
            self.usernameTextField.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 1),
            self.usernameTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 1),
            self.trailingAnchor.constraint(equalToSystemSpacingAfter: self.usernameTextField.trailingAnchor, multiplier: 1)
        ]);
         */
        
        self.stackView.addArrangedSubview(self.usernameTextField);
        self.stackView.addArrangedSubview(self.dividerView);
        self.stackView.addArrangedSubview(self.passwordTextField);
        self.addSubview(self.stackView)
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 1),
            self.stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 1),
            self.trailingAnchor.constraint(equalToSystemSpacingAfter: self.stackView.trailingAnchor, multiplier: 1),
            self.bottomAnchor.constraint(equalToSystemSpacingBelow: self.stackView.bottomAnchor, multiplier: 1)
        ]);
        
        self.dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true;
    }
    
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.endEditing(true);
        return true;
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
