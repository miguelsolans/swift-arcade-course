//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Miguel Solans on 03/06/2022.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    
    // Request models
    var profile: Profile?
    var accounts: [Account]?
    
    // View Models
    var headerViewModel = AccountSummaryHeaderView.ViewModel(welcomeMessage: "Welcome", name: "", date: Date())
    var accountsCellViewModel: [AccountSummaryCell.ViewModel] = []
    
    // Components
    let tableView = UITableView();
    var headerView = AccountSummaryHeaderView(frame: .zero);
    let refreshControl = UIRefreshControl();
    
    // lazy var : are a different way to instantiate on ViewControllers. It will only be instiantated when called.
    lazy var logoutBarButtonItem : UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        barButtonItem.tintColor = .label
        return barButtonItem
    }();
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup();
        fetchData();
    }
}

extension AccountSummaryViewController {
    func setup() {
        setupNavigationBar();
        setupTableView();
        setupTableHeaderView();
        setupRefreshControl();
    }
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = logoutBarButtonItem;
    }
    
    func setupTableHeaderView() {
        // No initial size
        self.headerView = AccountSummaryHeaderView(frame: .zero);
        
        // Layout itself out in the smallest format it can
        var size = self.headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width;
        self.headerView.frame.size = size;
        
        tableView.tableHeaderView = self.headerView;
    }
    
    func setupTableView() {
        self.tableView.backgroundColor = appColor;
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
    
    private func setupRefreshControl() {
        self.refreshControl.tintColor = appColor;
        self.refreshControl.addTarget(self, action: #selector(refreshContent), for: .valueChanged);
        self.tableView.refreshControl = self.refreshControl;
    }
}

// MARK: - UITableView Delegate and Data Source Methods

extension AccountSummaryViewController : UITableViewDataSource {
    
    // MARK: - UITableView Data Source Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard !accountsCellViewModel.isEmpty else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
        
        let account = self.accountsCellViewModel[ indexPath.row ];
        
        cell.configure(with: account)
        
        return cell;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.accountsCellViewModel.count
    }
    
}

extension AccountSummaryViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Actions
extension AccountSummaryViewController {
    @objc func logoutTapped() {
        NotificationCenter.default.post(name: .logout, object: nil);
    }
    
    @objc func refreshContent() {
        self.fetchData();
    }
}

// Networking
extension AccountSummaryViewController {
    private func fetchData() {
        let group = DispatchGroup();
        
        // Testing - random number selection
        let userId = String(Int.random(in: 1..<4));
        
        group.enter()
        fetchProfile(forUserId: userId) { result in
            switch result {
            case .success(let profile):
                self.profile = profile;
                self.configureTableHeaderView(with: profile);
            case .failure(let error):
                print(error.localizedDescription)
            }
            group.leave()
        }
        
        group.enter()
        fetchAccounts(forUserId: userId) { result in
            switch result {
            case .success(let accounts):
                self.accounts = accounts
                self.configureTableCells(with: accounts);
            case .failure(let error):
                print(error.localizedDescription)
            }
            group.leave()
        }
        
        
        group.notify(queue: .main) {
            self.tableView.reloadData();
            self.tableView.refreshControl?.endRefreshing();
        }
    }
    
    
    private func configureTableHeaderView(with profile: Profile) {
        let viewModel = AccountSummaryHeaderView.ViewModel(welcomeMessage: "Good morning,", name: profile.firstName, date: Date());
        headerView.configure(viewModel: viewModel);
    }
    
    private func configureTableCells(with accounts: [Account]) {
        self.accountsCellViewModel = accounts.map {
            AccountSummaryCell.ViewModel(accountType: $0.type, accountName: $0.name, balance: $0.amount)
        }
    }
}
