//
//  AccountSummaryViewController+Networking.swift
//  Bankey
//
//  Created by Miguel Solans on 25/03/2023.
//

import Foundation
import UIKit

enum NetworkError: Error {
case serverError
case decodingError
}

struct Profile: Codable {
    let id: String
    let firstName: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
    }
}


struct Account: Codable {
    let id: String
    let type: AccountType
    let name: String
    let amount: Double
    let createdDateTime: String;
    
    static func makeSkeleton() -> Account {
        return Account(id: "1", type: .Banking, name: "Account name", amount: 0.0, createdDateTime: "");
    }
}

extension AccountSummaryViewController {
    
    func fetchAccounts(forUserId userId: String, completion: @escaping(Result<[Account], NetworkError>) -> Void) {
        let url = URL(string: "https://fierce-retreat-36855.herokuapp.com/bankey/profile/\(userId)/accounts")!;
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return;
                }
                
                do {
                    let accounts = try JSONDecoder().decode([Account].self, from: data);
                    completion(.success(accounts))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }).resume();
    }
    
    func fetchProfile(forUserId userId: String , completion: @escaping(Result<Profile, NetworkError>) -> Void) {
        let url = URL(string: "https://fierce-retreat-36855.herokuapp.com/bankey/profile/\(userId)")!;
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return;
                }
                
                do {
                    let profile = try JSONDecoder().decode(Profile.self, from: data);
                    completion(.success(profile))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }).resume();
    }
}
