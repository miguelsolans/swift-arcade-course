//
//  UITextField+SecureToggle.swift
//  Bankey
//
//  Created by Miguel Solans on 13/11/2022.
//

import Foundation
import UIKit


let passwordToggleButton = UIButton(type: .custom);

extension UITextField {

    func enablePasswordToggle() {
        passwordToggleButton.setImage(UIImage(named: "eye.fill"), for: .normal);
        passwordToggleButton.setImage(UIImage(named: "eye.slash.fill"), for: .selected);
        
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside);
        
        rightView = passwordToggleButton;
        rightViewMode = .always;
    }
    
    @objc func togglePasswordView( _ sender: Any) {
        isSecureTextEntry.toggle()
        passwordToggleButton.isSelected.toggle()
    }
    
}
