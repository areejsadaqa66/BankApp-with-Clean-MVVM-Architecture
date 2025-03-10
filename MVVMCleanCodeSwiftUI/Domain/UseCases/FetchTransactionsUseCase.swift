//
//  FetchTransactionsUseCase.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation
protocol FetchTransactionsUseCaseProtocol {
    func execute() async -> Result<[Transaction], Error>
}

class FetchTransactionsUseCase: FetchTransactionsUseCaseProtocol {
    private let repository: TransactionRepositoryProtocol
    
    init(repository: TransactionRepositoryProtocol = TransactionRepository()) {
        self.repository = repository
    }
    
    func execute() async -> Result<[Transaction], Error>  {
         await repository.fetchTransactions()
    }
}
