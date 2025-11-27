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
    
    func displayDifference() -> Double {
        
    }
    
    func updateDifferenceWithLastMonth() -> UIImage{
        if newBalance > lastBalance{
            UIImage(systemName: "arrow.up")!
        }else if newBalance < lastBalance{
            UIImage(systemName: "arrow.down")!
        }else {
            UIImage(systemName: "arrow.2.circlepath.circle")!
        }
    }
}
