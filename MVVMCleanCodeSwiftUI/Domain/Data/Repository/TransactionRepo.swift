//
//  TransactionRepository.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation

protocol TransactionRepositoryProtocol {
    func fetchTransactions() async -> Result<[Transaction], Error>
}

class TransactionRepository: BaseRepo, TransactionRepositoryProtocol {
    override init() {
        super.init()
    }
    
    func fetchTransactions() async -> Result<[Transaction], Error> {
        let endpoint = APIEndpoints.transactions
        
        do {
            // Use the `request` method from `BaseRepo` to fetch transactions
            let transactions: [Transaction] = try await request(api: endpoint, model: [Transaction].self)
            return .success(transactions)
        } catch {
            return .failure(error)
        }
    }
}
