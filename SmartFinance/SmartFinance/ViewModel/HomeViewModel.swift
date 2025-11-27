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
    var lastBalance : Double = 1110.10
    var newBalance : Double = 1230.99
    
    func displayDifference() -> String {
        let division = lastBalance / newBalance
        let arround = division.rounded()
        if arround > 0 {
            return "+ \(arround) this mouth"
        }else if arround < 0{
            return "+ \(arround) this mouth"
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
            "arrow.2.circlepath.circle"
        }
    }
}
