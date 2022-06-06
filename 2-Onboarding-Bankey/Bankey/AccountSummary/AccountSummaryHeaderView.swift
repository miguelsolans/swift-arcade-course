//
//  AccountSummaryHeaderView.swift
//  Bankey
//
//  Created by Miguel Solans on 03/06/2022.
//

import UIKit

class AccountSummaryHeaderView: UIView {

    @IBOutlet var contentView: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        commonInit();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
        commonInit();
    }
    
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 144);
    }
    
    
    func commonInit() {
        let bundle = Bundle(for: AccountSummaryHeaderView.self);
        bundle.loadNibNamed("AccountSummaryHeaderView", owner: self, options: nil)
        self.addSubview(contentView);
        self.contentView.backgroundColor = appColor;
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false;
        self.contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true;
        self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true;
        self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true;
        self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true;
    }

}
