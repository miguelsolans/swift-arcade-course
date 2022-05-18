//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Miguel Solans on 18/05/2022.
//

import UIKit


class OnboardingViewController: UIViewController {
    
    let stackView = UIStackView();
    let label = UILabel();
    let imageView = UIImageView();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        style();
        layout();
    }
}


extension OnboardingViewController {
    func style() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false;
        self.stackView.axis = .vertical;
        self.stackView.spacing = 20;
        
        
        self.label.translatesAutoresizingMaskIntoConstraints = false;
        self.label.font = UIFont.preferredFont(forTextStyle: .title3);
        self.label.textAlignment = .center;
        self.label.adjustsFontForContentSizeCategory = true
        self.label.numberOfLines = 0;
        self.label.text = "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989.";
        
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false;
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.image = UIImage(named: "delorean")
    }
    
    func layout() {
        self.stackView.addArrangedSubview(self.imageView);
        self.stackView.addArrangedSubview(self.label);
        
        self.view.addSubview(self.stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: self.stackView.trailingAnchor, multiplier: 1)
        ]);
    }
}
