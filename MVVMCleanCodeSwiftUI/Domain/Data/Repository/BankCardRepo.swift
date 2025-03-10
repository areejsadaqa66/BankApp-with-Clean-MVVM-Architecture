//
//  BankCardRepo.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation

protocol BankCardRepoProtocol {
    func fetchBankCards() async throws -> [BankCard]
}

class BankCardRepo: BaseRepo, BankCardRepoProtocol {
    override init() {
        super.init()
    }
    
    func fetchBankCards() async throws -> [BankCard] {
        let endpoint = APIEndpoints.bankCards
        return try await request(api: endpoint, model: [BankCard].self)
    }
}
