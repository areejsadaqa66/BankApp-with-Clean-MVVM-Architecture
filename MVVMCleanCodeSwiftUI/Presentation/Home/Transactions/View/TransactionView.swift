//
//  TransactionView.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation
import SwiftUI
struct TransactionView: View {
    @StateObject private var viewModel: TransactionViewModel
    
    init(viewModel: TransactionViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else {
                ScrollView {
                    VStack {
                        ForEach(viewModel.transactions, id: \.id) { transaction in
                            TransactionCard(transaction: transaction)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.bottom)
                }
            }
        }.onAppear {
            print("TransactionView appeared!")
        }
    }
    
}

struct TransactionCard: View {
    let transaction: Transaction
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(transaction.title ?? "")
                .font(.headline)
            Text("\(transaction.userId ?? 0)")
                .font(.subheadline)
            Text(transaction.body ?? "")
                .font(.body)
        }
        .padding()
        .foregroundColor(.black)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}
