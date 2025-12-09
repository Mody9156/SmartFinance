//
//  UserProfileService.swift
//  SmartFinance
//
//  Created by Modibo on 09/12/2025.
//

import Foundation
import Observation

class UserProfileService {
    var CurrencySymbols: [String : CurrencySymbol] = {
        var dict: [String : CurrencySymbol] = [:]
        CurrencySymbol.allCases.forEach { currency  in
            dict[currency.rawValue] = currency
        }
        return dict
    }()
    
    func selectedCurrencySymbolse(element: String) -> String {
        return CurrencySymbols[element]?.symbol ?? "?"
        
    }
    
}
