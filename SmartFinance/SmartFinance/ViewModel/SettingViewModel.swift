//
//  SettingViewModel.swift
//  SmartFinance
//
//  Created by Modibo on 10/12/2025.
//

import Foundation
import Observation

@Observable
class SettingViewModel {
  let userProfile: UserProfileService
    
    init(
        userProfile: UserProfileService = UserProfileService(converterManager: ConverterManager())
    ) {
        self.userProfile = userProfile
    }
    
    func selectedCategoryIcone(element: String) -> String {
         userProfile.selectedCurrencySymbolse(element: element)
    }
    
    func getConversions() async {
       try? await userProfile.getConversions()
    }
}
