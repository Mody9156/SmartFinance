//
//  BasicHTTPClient.swift
//  SmartFinance
//
//  Created by Modibo on 01/12/2025.
//

import Foundation
class BasicHTTPClient : HTTPService {
    
    private var session : URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    enum httpError : Error {
        case invalidResponse
    }
    
    func fetchRequest(_ request: URLRequest) async throws -> (
        Data,
        URLResponse
    ) {
        let (data,response) = try await session.data(for: request)
        
        guard let htppResponse = response as? HTTPURLResponse, htppResponse.statusCode == 200 else {
            throw httpError.invalidResponse
        }
        
        return (data,response)
        
    }
    
}
