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
    
    init(
        userProfileService: UserProfileService = UserProfileService()
    ) {
        self.userProfileService = userProfileService
    }
 
    func selectedCurrencySymbolse(element: String) -> String {
        userProfileService.selectedCurrencySymbolse(element: element)
        
    }
    
}
