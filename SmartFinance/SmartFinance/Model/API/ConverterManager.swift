//
//  ConverterManager.swift
//  SmartFinance
//
//  Created by Modibo on 01/12/2025.
//

import Foundation

class ConverterManager : ConverterService  {
    
    var session : HTTPService
    
    init(session: HTTPService = BasicHTTPClient()) {
        self.session = session
    }
    
    enum fetchError : Error {
        case invalidResponse,invalidDecoder
    }
    
    func fetchData() -> URLRequest {
        let url = URL(string:"https://v6.exchangerate-api.com/v6/36bee9348b784097fe4c82d5/latest/USD")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
    func showConverter() async throws -> Convert {
        let request = fetchData()
        let (data,response) = try await session.fetchRequest(request)
        print("data : \(data)")
        print("response : \(response)")
        guard let htppResponse = response as? HTTPURLResponse, htppResponse.statusCode == 200 else {
            throw fetchError.invalidResponse
        }
        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase // utilisation de camelCase
        
        guard let result = try? decoder.decode(Convert.self, from: data) else {
            throw fetchError.invalidDecoder
        }
        
        return result
    }
}
