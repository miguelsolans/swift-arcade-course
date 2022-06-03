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
    }
    
    
    func setupTableView() {
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
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
        let cell = UITableViewCell();
        
        cell.textLabel?.text = self.games[ indexPath.row ];
        
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
        
    }
}
