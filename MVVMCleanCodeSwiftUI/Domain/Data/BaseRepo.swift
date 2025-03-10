//
//  BaseRepo.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation
import Alamofire

class BaseRepo {
     let network: NetworkServiceProtocol
    
     init() {
         self.network = NetworkService()
    }

    @discardableResult
    func request<T: Decodable>(api: Endpoint, model: T.Type) async throws -> T {
        do {
            return try await network.request(endpoint: api)
        } catch {
            throw mapToRepoError(error)
        }
    }
    
    private func mapToRepoError(_ error: Error) -> Error {
        // Custom error mapping logic (if needed)
        return error
    }
}
