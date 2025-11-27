//
//  HomeViewModel.swift
//  SmartFinance
//
//  Created by Modibo on 24/11/2025.
//

import Foundation
import Observation
import SwiftData
import UIKit

@Observable
class HomeViewModel {
    
    func updateDifferenceWithLastMonth(lastBalance:Int,newBalance:Int) -> UIImage{
        if newBalance > lastBalance{
            UIImage(systemName: "arrow.up")!
        }else if newBalance < lastBalance{
            UIImage(systemName: "arrow.down")!
        }else {
            UIImage(systemName: "arrow.2.circlepath.circle")!
        }
    }
}
