//
//  BankCardView.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation
import SwiftUI

struct BankCardView: View {
    var card: BankCard

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: card.gradientColors),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .cornerRadius(20)
                .shadow(radius: 5)

            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "creditcard.fill")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "wave.3.right.circle.fill") // Contactless icon
                        .foregroundColor(.white)
                }
                .padding(.horizontal)

                Text("**** **** **** \(String(card.cardNumber.suffix(4)))")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)

                HStack {
                    VStack(alignment: .leading) {
                        Text("Card Holder")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                        Text(card.cardHolder)
                            .foregroundColor(.white)
                            .bold()
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Expires")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                        Text(card.expiryDate)
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .frame(height: 220)
        .padding(.horizontal)
    }
}
