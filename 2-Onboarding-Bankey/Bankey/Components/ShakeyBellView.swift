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
        setup();
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
    func setup() {
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)));
        self.imageView.addGestureRecognizer(singleTap);
        self.imageView.isUserInteractionEnabled = true;
    }
    
    func style() {
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.imageView.translatesAutoresizingMaskIntoConstraints = false;
        let image = UIImage(systemName: "bell.fill")!.withTintColor(.white, renderingMode: .alwaysOriginal);
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

extension ShakeyBellView {
    @objc func imageViewTapped(_ recognizer: UITapGestureRecognizer) {
       // Animation should go here
        print("Bell tapped!!");
        self.shakeWith(duration: 1.0, angle: .pi/8, yOffset: 0.0)
    }
    
    private func shakeWith(duration: Double, angle: Double, yOffset: Double) {
        let numberOfFrames: Double = 6;
        let frameDuration = 1/numberOfFrames; // We need to normalize it by 1
        
        self.imageView.setAnchorPoint(CGPoint(x: 0.5, y: yOffset))
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options:[]) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: -angle);
            }
            
            UIView.addKeyframe(withRelativeStartTime: frameDuration, relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: angle);
            }
            
            UIView.addKeyframe(withRelativeStartTime: frameDuration*2, relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: -angle);
            }
            
            UIView.addKeyframe(withRelativeStartTime: frameDuration*3, relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: angle);
            }
            
            UIView.addKeyframe(withRelativeStartTime: frameDuration*4, relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: -angle);
            }
            
            UIView.addKeyframe(withRelativeStartTime: frameDuration*5, relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform.identity; // reset to original starting point 
            }
        }
        
    }
}



