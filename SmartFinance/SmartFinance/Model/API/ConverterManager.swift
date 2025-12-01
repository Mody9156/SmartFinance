//
//  ConverterManager.swift
//  SmartFinance
//
//  Created by Modibo on 01/12/2025.
//

import Foundation

class ConverterManager {
    
    
    func fetchData() -> URLRequest {
        let url = URL(string:"https://v6.exchangerate-api.com/v6/36bee9348b784097fe4c82d5/latest/USD")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
    func showConverter() -> [Transaction] {
        
    }
}
