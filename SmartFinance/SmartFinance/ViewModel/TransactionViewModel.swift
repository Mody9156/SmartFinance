//
//  TransactionViewModel.swift
//  SmartFinance
//
//  Created by Modibo on 10/12/2025.
//

import Foundation
import Observation

@Observable
class TransactionViewModel {
    var userProfileService : UserProfileService
    var CurrencySymbols: [String : CurrencySymbol] = {
        var dict: [String : CurrencySymbol] = [:]
        CurrencySymbol.allCases.forEach { currency  in
            dict[currency.rawValue] = currency
        }
        return dict
    }()
    
    var icon: [String : CategoryIcon] = {
        Dictionary(
            uniqueKeysWithValues: CategoryIcon.allCases.map{($0.rawValue,$0)
            })
    }()
    
    init(
        userProfileService: UserProfileService = UserProfileService()
    ) {
        self.userProfileService = userProfileService
    }
 
    func selectedCurrencySymbolse(element: String) -> String {
        userProfileService.selectedCurrencySymbolse(element: element)
        
    }
    func iconeType(element:String) -> String {
        return icon[element,default: CategoryIcon.Autre].icon
    }
}
