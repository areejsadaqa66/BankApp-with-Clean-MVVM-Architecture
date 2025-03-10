//
//  APIEndpoints.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation
import Alamofire

enum APIEndpoints {
    case bankCards
    case transactions
}

// MARK: - Endpoint Conformance

extension APIEndpoints: Endpoint {
    
    var path: String {
        switch self {
        case .bankCards:
            return ""
        case .transactions:
            return "/posts"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .bankCards:
            return .get
        case .transactions:
            return .get
        }
    }

    var body: Parameters? {
          switch self {
          case .bankCards:
              return nil
          case .transactions:
              return nil
          }
    }
}
