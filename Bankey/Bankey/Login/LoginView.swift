//
//  LoginView.swift
//  Bankey
//
//  Created by Miguel Solans on 10/05/2022.
//

import UIKit

class LoginView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        
        self.style()
        self.layout();
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension LoginView {
    
    func style() {
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.backgroundColor = .systemIndigo
    }
    
    func layout() {
        
    }
    
}
