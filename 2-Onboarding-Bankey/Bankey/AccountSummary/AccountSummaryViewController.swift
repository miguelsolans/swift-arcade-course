//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Miguel Solans on 03/06/2022.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    
    var accounts: [AccountSummaryCell.ViewModel] = []
    let tableView = UITableView();
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup();
        fetchData();
    }
    

}

extension AccountSummaryViewController {
    func setup() {
        setupTableView();
        setupTableHeaderView();
    }
    
    func setupTableHeaderView() {
        // No initial size
        let header = AccountSummaryHeaderView(frame: .zero);
        
        // Layout itself out in the smallest format it can
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width;
        header.frame.size = size;
        
        tableView.tableHeaderView = header;
    }
    
    func setupTableView() {
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        self.tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseID);
        self.tableView.rowHeight = AccountSummaryCell.rowHeight;
        self.tableView.tableFooterView = UIView();
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false;
        self.view.addSubview(self.tableView);
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ]);
        
    }
}

// MARK: - UITableView Delegate and Data Source Methods

extension AccountSummaryViewController : UITableViewDataSource {
    
    // MARK: - UITableView Data Source Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard !accounts.isEmpty else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
        
        let account = self.accounts[ indexPath.row ];
        
        cell.configure(with: account)
        
        return cell;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.accounts.count
    }
    
}

extension AccountSummaryViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AccountSummaryViewController {
    private func fetchData() {
        let savings = AccountSummaryCell.ViewModel(accountType: .Banking,
                                                            accountName: "Basic Savings",
                                                        balance: 929466.23)
        let chequing = AccountSummaryCell.ViewModel(accountType: .Banking,
                                                    accountName: "No-Fee All-In Chequing",
                                                    balance: 17562.44)
        let visa = AccountSummaryCell.ViewModel(accountType: .CreditCard,
                                                       accountName: "Visa Avion Card",
                                                       balance: 412.83)
        let masterCard = AccountSummaryCell.ViewModel(accountType: .CreditCard,
                                                       accountName: "Student Mastercard",
                                                       balance: 50.83)
        let investment1 = AccountSummaryCell.ViewModel(accountType: .Investment,
                                                       accountName: "Tax-Free Saver",
                                                       balance: 2000.00)
        let investment2 = AccountSummaryCell.ViewModel(accountType: .Investment,
                                                       accountName: "Growth Fund",
                                                       balance: 15000.00)
        accounts.append(savings)
        accounts.append(chequing)
        accounts.append(visa)
        accounts.append(masterCard)
        accounts.append(investment1)
        accounts.append(investment2)
        
        self.tableView.reloadData()
    }
}
