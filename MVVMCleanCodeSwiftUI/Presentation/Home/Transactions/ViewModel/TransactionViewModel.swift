//
//  TransactionViewModel.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation
import SwiftUI
import Combine

protocol TransactionViewModelProtocol: AnyObject {
    func fetchTransactions() async

}
final class TransactionViewModel: ObservableObject, TransactionViewModelProtocol {
    @Published var transactions: [Transaction] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private let fetchTransactionsUseCase: FetchTransactionsUseCaseProtocol
    
    init(fetchTransactionsUseCase: FetchTransactionsUseCaseProtocol) {
        self.fetchTransactionsUseCase = fetchTransactionsUseCase
        
        Task {
            await self.fetchTransactions()
        }
    }
    
    func fetchTransactions() async {
        self.isLoading = true
        let results = await fetchTransactionsUseCase.execute()
        
            switch results {
            case .success(let response):
                DispatchQueue.main.async {
                    self.transactions = response.map {
                        .init(id: $0.id, title: $0.title, userId: $0.userId, body: $0.body)
                    }
                    print(self.transactions)
                }
               
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
}
