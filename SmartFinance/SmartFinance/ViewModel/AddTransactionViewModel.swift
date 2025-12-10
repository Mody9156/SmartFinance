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
    var conversion : Convert? = nil
    var currentError : ConversionError? = nil
    var userProfileService : UserProfileService
    
    init(converterManager: ConverterService = ConverterManager(), userProfileService: UserProfileService = UserProfileService()) {
        self.converterManager = converterManager
        self.userProfileService = userProfileService
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
    //Modifier
    func categoryType(element: String) -> String {
        let positives = ["Salaire","Revenu","Dépôt","Virement reçu"]
        return positives.contains(element) ? "+":"-"
    }
    //
    func selectedCategoryIcone(element: String) -> String {
        return userProfileService
            .CurrencySymbols[element,default: CurrencySymbol.EUR].symbol
    }
    
    @MainActor
    func getConversions() async {
        do {
            let result = try await converterManager.showConverter()
            self.conversion = result
            self.currentError = nil
        } catch {
            self.currentError = .unknown
        }
    }
    
    func exchangeRate(amount:Double, to targetCurrency:String,baseCurrency:String) -> Double {
        guard let firstConvert = conversion else { return 0 }
        
        let rates = firstConvert.conversionRates
        
        guard let baseRate = rates[baseCurrency],
              let targetRate = rates[targetCurrency] else { return amount }
        
        let amountInBase = amount / baseRate
        let convertedAmount = amountInBase * targetRate
        
        return convertedAmount
    }
}
