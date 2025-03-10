//
//  CardsCarouselView.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation
import SwiftUI

struct CardsCarouselView: View {
    @StateObject private var viewModel: BankCardViewModel
    
    init(viewModel: BankCardViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        TabView {
            ForEach(viewModel.bankCard) { card in
                BankCardView(card: card)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 250)
    }
}
