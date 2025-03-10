//
//  FetchBankCardsUseCase.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation

import Foundation
protocol FetchBankCardsUseCaseProtocol {
    func execute() async -> Result<[BankCard], Error>
}

class FetchBankCardsUseCase: FetchBankCardsUseCaseProtocol {
    private let repository: BankCardRepoProtocol
    
    init(repository: BankCardRepoProtocol = BankCardRepo()) {
        self.repository = repository
    }
    
    func execute() async -> Result<[BankCard], Error>  {
        // Static data
        let cards: [BankCard] = [
            BankCard(cardNumber: "7690", cardHolder: "SwiftUICodes", expiryDate: "12/27", gradientColors: [.blue, .purple]),
            BankCard(cardNumber: "1234", cardHolder: "John Doe", expiryDate: "01/29", gradientColors: [.purple, .pink]),
            BankCard(cardNumber: "5678", cardHolder: "Jane Smith", expiryDate: "05/26", gradientColors: [.orange, .red])
        ]
        
        // Return the static data as a success result
        return .success(cards)
    }
}
