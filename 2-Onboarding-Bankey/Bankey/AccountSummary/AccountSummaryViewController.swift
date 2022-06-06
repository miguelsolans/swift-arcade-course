//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Miguel Solans on 03/06/2022.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    
    let tableView = UITableView();
    
    let games = [
        "Pacman",
        "Space Invaders",
        "Space Patrol"
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup();
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
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
        
        
        
        return cell;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.games.count
    }
    
}

extension AccountSummaryViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
