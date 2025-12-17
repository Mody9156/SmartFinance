//
//  UserProfileService.swift
//  SmartFinance
//
//  Created by Modibo on 09/12/2025.
//

import Foundation
import Observation

@Observable
class UserProfileService {
    var converterManager : ConverterService
    var conversion : [Convert] = []
    var currentError : ConversionError? = nil
    
    
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
    
        var currencySymbols: [String : CurrencySymbol] = {
        Dictionary(
            uniqueKeysWithValues: CurrencySymbol.allCases.map {
            ($0.rawValue,$0)
        })
    }()
  
    init(
        converterManager: ConverterService = ConverterManager(),
       
    ) {
        self.converterManager = converterManager
    }
    
    //Modification
    func selectedCurrencySymbolse(element: String) -> String {
        return currencySymbols[element, default: CurrencySymbol.EUR].symbol
        
    }
    //
   
    
    func getConversions() async throws {
        do {
            let result = try await converterManager.showConverter()
            self.conversion = [result]
            self.currentError = nil
        } catch {
            self.currentError = .network
        }
    }
}
