//
//  HomeTransactionModel.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation
struct Transaction: Identifiable, Decodable, Hashable {
    let id: Int?
    let title: String?
    let userId: Int?
    let body: String?
    
    init(id: Int?, title: String?, userId: Int?, body: String?) {
        self.id = id
        self.title = title
        self.userId = userId
        self.body = body
    }
}
