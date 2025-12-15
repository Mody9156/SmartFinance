//
//  HomeViewModel.swift
//  SmartFinance
//
//  Created by Modibo on 24/11/2025.
//

import Foundation
import Observation

@Observable
class HomeViewModel {
    var lastBalance : Double = 0.0
    var newBalance : Double = 0.0
    var userProfileService : UserProfileService
    
    init(
        userProfileService: UserProfileService = UserProfileService()
    ) {
        self.userProfileService = userProfileService
    }
    
    
    func selectedCurrencySymbolse(element: String) -> String {
        return userProfileService.selectedCurrencySymbolse(element: element)
    }
    
    func selectedNumber() -> Double {
        if lastBalance >= newBalance {
            return lastBalance - newBalance
        }else {
            return newBalance - lastBalance
        }
    }
    
    func displayDifference() -> String {
        
        let division = selectedNumber()
        let arround = division.rounded()
        if arround > 0 {
            return "+\(arround) this mouth"
        }else if arround < 0{
            return "-\(arround) this mouth"
        }else {
            return "\(arround) this mouth"
        }
    }
    
    func updateDifferenceWithLastMonth() -> String{
        if newBalance > lastBalance{
            "arrow.up"
        }else if newBalance < lastBalance{
            "arrow.down"
        }else {
            ""
        }
    }
    
    //Suppression de prefix - et +
    func cleanSign(amount:String) -> Double {
        let cleaned = amount.trimmingCharacters(
            in: CharacterSet(charactersIn: "-+")
        )
       return Double (cleaned) ?? 0
    }
    
    
    func UpdateBalance(transaction : [Transaction]) -> Double{
        let amount = transaction.map{$0.amount}.reduce(0, +)
        newBalance = amount
        lastBalance = amount
        return amount
    }
}
