//
//  TransactionViewBuilder.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation
struct TransactionViewBuilder {
    static func build() -> TransactionView {
        let useCase = FetchTransactionsUseCase()
        let viewModel = TransactionViewModel(
            fetchTransactionsUseCase: useCase
        )
        let view = TransactionView(viewModel: viewModel)
        return view
    }
}
