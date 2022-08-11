//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Miguel Solans on 06/06/2022.
//

import Foundation
import UIKit

class AccountSummaryCell : UITableViewCell {
    
    enum AccountType: String {
        case Banking
        case CreditCard
        case Investment
    }
    
    struct ViewModel {
        let accountType: AccountType
        let accountName: String
        let balance: Double
        
        var balanceAsAttributedString: NSAttributedString {
            return CurrencyFormatter().makeAttributedCurrency(balance)
        }
    }
    
    let viewModel: ViewModel? = nil;
    
    let typeLabel = UILabel();
    let underlineView = UIView();
    let nameLabel = UILabel();
    
    let balanceStackView = UIStackView();
    let balanceLabel = UILabel();
    let balanceAmountLabel = UILabel();
    let chevronImageView = UIImageView();
    
    static let reuseID = "AccountSummaryCell";
    static let rowHeight: CGFloat = 112;
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setup();
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


extension AccountSummaryCell {
    func setup() {
        self.typeLabel.translatesAutoresizingMaskIntoConstraints = false;
        self.typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1);
        self.typeLabel.adjustsFontForContentSizeCategory = true;
        self.typeLabel.text = "Account type";
        
        self.underlineView.translatesAutoresizingMaskIntoConstraints = false;
        self.underlineView.backgroundColor = appColor;
        
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false;
        self.nameLabel.font = UIFont.preferredFont(forTextStyle: .body);
        self.nameLabel.text = "Account Name"
        
        self.balanceStackView.translatesAutoresizingMaskIntoConstraints = false;
        self.balanceStackView.axis = .vertical;
        
        self.balanceLabel.translatesAutoresizingMaskIntoConstraints = false;
        self.balanceLabel.font = UIFont.preferredFont(forTextStyle: .body);
        self.balanceLabel.textAlignment = .right;
        self.balanceLabel.text = "Some balance";
        
        
        self.balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false;
        self.balanceAmountLabel.textAlignment = .center;
        
        self.balanceStackView.addArrangedSubview(self.balanceLabel);
        self.balanceStackView.addArrangedSubview(self.balanceAmountLabel);
        
        self.chevronImageView.translatesAutoresizingMaskIntoConstraints = false;
        let chevronImage = UIImage(systemName: "chevron.right")!
            .withTintColor(appColor, renderingMode: .alwaysOriginal) // Set Color on a SF Symbol
        self.chevronImageView.image = chevronImage;
        
        self.contentView.addSubview(balanceStackView)
        self.contentView.addSubview(underlineView)
        self.contentView.addSubview(typeLabel)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(chevronImageView)
    }
    
    
    func layout() {
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            
            
            underlineView.topAnchor.constraint(equalToSystemSpacingBelow: self.typeLabel.bottomAnchor, multiplier: 1),
            underlineView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            underlineView.widthAnchor.constraint(equalToConstant: 60),
            underlineView.heightAnchor.constraint(equalToConstant: 4),
            
            
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: self.underlineView.bottomAnchor, multiplier: 2),
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 2),
            
            
            balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: self.underlineView.bottomAnchor, multiplier: 0),
            balanceStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.nameLabel.trailingAnchor, multiplier: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: self.balanceStackView.trailingAnchor, multiplier: 4),
            
            chevronImageView.topAnchor.constraint(equalToSystemSpacingBelow: self.underlineView.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1)
        ])
    }
}


extension AccountSummaryCell {
    func configure(with viewModel: ViewModel) {
        typeLabel.text = viewModel.accountType.rawValue
        nameLabel.text = viewModel.accountName
        balanceAmountLabel.attributedText = viewModel.balanceAsAttributedString
        
        switch viewModel.accountType {
            case .Banking:
                underlineView.backgroundColor = appColor
                balanceLabel.text = "Current Balance"
                break
            case .CreditCard:
                underlineView.backgroundColor = .systemOrange;
                balanceLabel.text = "Balance";
                break
            case .Investment:
                underlineView.backgroundColor = .systemPurple
                balanceLabel.text = "Value"
                break
        }
    }
}
