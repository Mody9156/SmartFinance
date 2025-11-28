//
//  HomeViewModel.swift
//  SmartFinance
//
//  Created by Modibo on 24/11/2025.
//

import Foundation
import Observation
import UIKit

@Observable
class HomeViewModel {
    var lastBalance : Double 
    var newBalance : Double
    
    init(lastBalance: Double = 55_000, newBalance: Double = 10_000) {
        self.lastBalance = lastBalance
        self.newBalance = newBalance
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
            return "+$\(arround) this mouth"
        }else if arround < 0{
            return "-$\(arround) this mouth"
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
}
