//
//  ShakeyBellView.swift
//  Bankey
//
//  Created by Miguel Solans on 11/02/2023.
//

import UIKit

class ShakeyBellView : UIView {
    
    let imageView = UIImageView();
    
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        style();
        layout();
    }
    
    override required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented!");
    }
    
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 48, height: 48)
    }
}

extension ShakeyBellView {
    func style() {
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.imageView.translatesAutoresizingMaskIntoConstraints = false;
        let image = UIImage(named: "bell.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal);
        self.imageView.image = image;
    }
    
    func layout() {
        self.addSubview(imageView);
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 24),
            imageView.widthAnchor.constraint(equalToConstant: 24)
        ]);
    }
}
