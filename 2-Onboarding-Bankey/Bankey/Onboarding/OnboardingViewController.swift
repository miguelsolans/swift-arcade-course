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
    
    let heroImageName: String;
    let titleText: String;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        style();
        layout();
    }
    
    init(heroImageName: String, titleText: String) {
        self.heroImageName = heroImageName;
        self.titleText = titleText;
        
        super.init(nibName: nil, bundle: nil);
    }
    
    // Constructor we need to override when we aren't using Storyboards
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


extension OnboardingViewController {
    func style() {
        self.view.backgroundColor = .systemBackground;
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false;
        self.stackView.axis = .vertical;
        self.stackView.spacing = 20;
        
        
        self.label.translatesAutoresizingMaskIntoConstraints = false;
        self.label.font = UIFont.preferredFont(forTextStyle: .title3);
        self.label.textAlignment = .center;
        self.label.adjustsFontForContentSizeCategory = true
        self.label.numberOfLines = 0;
        self.label.text = self.titleText;
        
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false;
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.image = UIImage(named: self.heroImageName)
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
