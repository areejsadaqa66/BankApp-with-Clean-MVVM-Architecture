//
//  NetworkService.swift
//  MVVMCleanCodeSwiftUI
//
//  Created by MacBookPro on 10/03/2025.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T
}

class NetworkService: NetworkServiceProtocol {
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T {
        let url = endpoint.baseURL + endpoint.path
        
        let dataTask = AF.request(url, method: endpoint.method, parameters: endpoint.body, encoding: JSONEncoding.default)
            .validate()
            .serializingDecodable(T.self)
        
        let result = await dataTask.result
        
        switch result {
        case .success(let decodedData):
            return decodedData
        case .failure(let error):
            throw error
        }
    }
}
