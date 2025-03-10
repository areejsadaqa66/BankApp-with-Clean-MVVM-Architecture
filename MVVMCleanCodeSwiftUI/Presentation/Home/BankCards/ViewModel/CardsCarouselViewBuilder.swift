//
//  CardsCarouselViewBuilder.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation
struct CardsCarouselViewBuilder {
    static func build() -> CardsCarouselView {
        let useCase = FetchBankCardsUseCase()
        let viewModel = BankCardViewModel(FetchBankCardsUseCase: useCase)
        let view = CardsCarouselView(viewModel: viewModel)
        return view
    }
}
