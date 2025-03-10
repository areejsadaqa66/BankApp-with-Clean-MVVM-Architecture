//
//  BankCardHome.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation
import SwiftUI

struct BankAppHomeView: View {
    var body: some View {
        VStack {
            // App Title
            Text("Bank App")
                .font(.largeTitle)
                .bold()
                .padding(.top, 20)

            // Profile Icon
            HStack {
                Spacer()
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
                    .padding(.trailing)
            }

            // Swipeable Cards
            CardsCarouselViewBuilder.build()

            // Recent Transactions Section
            VStack(alignment: .leading) {
                Text("Recent Transactions")
                    .font(.headline)
                    .padding(.horizontal)
                TransactionViewBuilder.build()
            }

            Spacer()
        }
    }
}
