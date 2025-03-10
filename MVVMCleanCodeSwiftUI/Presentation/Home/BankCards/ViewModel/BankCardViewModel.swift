//
//  BankCardViewModel.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation
import SwiftUI
import Combine

protocol BankCardViewModelProtocol: AnyObject {
    func fetchBankCards() async
    
}
final class BankCardViewModel: ObservableObject, BankCardViewModelProtocol {
    @Published var bankCard: [BankCard] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private let FetchBankCardsUseCase: FetchBankCardsUseCaseProtocol
    
    init(FetchBankCardsUseCase: FetchBankCardsUseCaseProtocol) {
        self.FetchBankCardsUseCase = FetchBankCardsUseCase
        
        Task {
            await self.fetchBankCards()
        }
    }
    
    func fetchBankCards() async {
        self.isLoading = true
        let results = await FetchBankCardsUseCase.execute()
        
        switch results {
        case .success(let response):
            DispatchQueue.main.async {
                self.bankCard = response
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
