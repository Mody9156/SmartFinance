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
    
    enum ConversionError: LocalizedError {
            case emptyArray
            case network
            case unknown
            
            var errorDescription: String? {
                switch self {
                case .emptyArray: return "Aucune conversion disponible."
                case .network: return "Problème de connexion."
                case .unknown: return "Une erreur inconnue est survenue."
                }
            }
        }
    
    
    @MainActor
    func getConversions() async  -> Convert {
        do {
            let result = try await converterManager.showConverter()
            self.conversion = [result]
            print("il y a \(conversion.count) conversions\(conversion)")
            print("félicitations")
            return result
        } catch {
             ConversionError.emptyArray
        }
      
    }
    
}
