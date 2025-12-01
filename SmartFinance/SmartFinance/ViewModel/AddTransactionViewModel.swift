//
//  AddTransactionViewModel.swift
//  SmartFinance
//
//  Created by Modibo on 01/12/2025.
//

import Foundation
import Observation

@Observable
class AddTransactionViewModel {
    var converterManager : ConverterService
    
    init(converterManager: ConverterService = ConverterManager()) {
        self.converterManager = converterManager
    }
    
    enum ConversionError: Error {
        case emptyArray
    }
    
    func getConversions() async throws -> [Convert] {
        do {
            return try await converterManager.showConverter()
        } catch {
            throw ConversionError.emptyArray
        }
    }
    
}
