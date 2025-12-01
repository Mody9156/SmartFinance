//
//  ConverterManager.swift
//  SmartFinance
//
//  Created by Modibo on 01/12/2025.
//

import Foundation

class ConverterManager {
    
    var session : HTTPService
    
    init(session: HTTPService = BasicHTTPClient()) {
        self.session = session
    }
    
    enum httpError : Error {
        case invalidResponse
    }
    
    func fetchData() -> URLRequest {
        let url = URL(string:"https://v6.exchangerate-api.com/v6/36bee9348b784097fe4c82d5/latest/USD")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
    func showConverter() async throws -> [Transaction] {
        let request = fetchData()
        let (data,response) = try await session.fetchRequest(request)
        
        guard let htppResponse = response as? HTTPURLResponse, htppResponse.statusCode == 200 else {
            throw httpError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        let result = try? decoder.decode([Transaction.self], from: data)
        
        return result
    }
}
