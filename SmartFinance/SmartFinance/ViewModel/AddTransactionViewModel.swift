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
    var currentError : ConversionError? = nil
    let userProfile: UserProfileService
    
    init(converterManager: ConverterService = ConverterManager(), userProfile: UserProfileService = UserProfileService()) {
        self.converterManager = converterManager
        self.userProfile = userProfile
    }
    
    let categoryIconMap: [String: CategoryIcon] = [
        // Dépenses
        "Alimentation": .alimentation,
        "Logement": .logement,
        "Transport": .transport,
        "Santé": .sante,
        "Divertissement": .divertissement,
        "Éducation": .education,
        "Shopping": .shopping,
        "Voyages": .voyages,
        "Services": .services,
        "Autre": .autre,
        "Impôts et taxes": .impotsEtTaxes,
        "Investissements": .investissements,
        "Épargne": .epargne,
        "Retrait": .retrait,

        // Revenus / transferts
        "Salaire": .salaire,
        "Revenu": .revenu,
        "Dépôt": .depot,
        "Virement reçu": .virementRecu,
        "Virement envoyé": .virementEnvoye,
        "Transfert interne": .transfertInterne
    ]
    
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
    
    func categoryType(element: String) -> String {
        if element == "Salaire" || element == "Revenu" || element == "Dépôt" || element == "Virement reçu" {
            return "+"
        }else {
            return "-"
        }
    }
    
    func selectedCategoryIcone(element: String) -> String {
         userProfile.selectedCurrencySymbolse(element: element)
    }
    
    @MainActor
    func getConversions() async {
        do {
            let result = try await converterManager.showConverter()
            self.conversion = [result]
            self.currentError = nil
        } catch {
            self.currentError = .network
        }
    }
    
    func exchangeRate(amount:Double, to targetCurrency:String,baseCurrency:String) -> Double {
        guard let firstConvert = conversion.first else { return 0 }
        
        let rates = firstConvert.conversionRates
        
        guard let baseRate = rates[baseCurrency],
              let targetRate = rates[targetCurrency] else { return 5 }
        
        let amountInBase = amount / baseRate
        let convertedAmount = amountInBase * targetRate
        
        return convertedAmount
    }
}
