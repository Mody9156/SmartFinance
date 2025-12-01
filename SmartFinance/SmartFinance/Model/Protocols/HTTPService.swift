//
//  ApiManagement.swift
//  SmartFinance
//
//  Created by Modibo on 01/12/2025.
//

import Foundation

protocol HTTPService {
    func fetchRequest(_ request:URLRequest) async throws -> (Data,URLResponse)
}
