//
//  UIViewController+Utils.swift
//  Bankey
//
//  Created by Miguel Solans on 31/05/2022.
//

import UIKit

extension UIViewController {
    
    func setStatusBar() {
        let statusBarSize = UIApplication.shared.statusBarFrame.size;
        let frame = CGRect(origin: .zero, size: statusBarSize);
        let statusBarView = UIView(frame: frame);
        
        statusBarView.backgroundColor = appColor;
        view.addSubview(statusBarView);
    }
    
    
    func setTabBarImage(imageName: String, title: String) {
        let configuraion = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuraion)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
    
}
