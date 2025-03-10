//
//  EndpointProtocol.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation
import Alamofire
// MARK: - Endpoint Protocol

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var body: Parameters? { get }
}

extension Endpoint {
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com/todos/1"
    }
}
