//
//  BankCard.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation
import SwiftUI

struct BankCard: Identifiable, Decodable, Hashable {
    let id = UUID()
    let cardNumber: String
    let cardHolder: String
    let expiryDate: String
    var gradientColors: [Color] = [.blue, .purple]
    
    enum CodingKeys: String, CodingKey {
         case cardNumber
         case cardHolder
         case expiryDate
     }
}
