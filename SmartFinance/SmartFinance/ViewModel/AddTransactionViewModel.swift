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
    var conversion : [Convert] = []
    init(converterManager: ConverterService = ConverterManager()) {
        self.converterManager = converterManager
    }
    
    enum ConversionError: Error {
        case emptyArray
    }
    
    
    @MainActor
    func getConversions() async throws -> Convert {
        do {
            let result = try await converterManager.showConverter()
            self.conversion = [result]
            print("il y a \(conversion.count) conversions\(conversion)")
            print("félicitations")
            return result
        } catch {
            throw ConversionError.emptyArray
        }
      
    }
    
}
