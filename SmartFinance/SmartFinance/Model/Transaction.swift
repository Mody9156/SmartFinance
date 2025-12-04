//
//  Transaction.swift
//  SmartFinance
//
//  Created by Modibo on 28/11/2025.
//

import Foundation
import SwiftData

@Model
final class Transaction: Identifiable, Hashable {
    var id = UUID()
    var name : String
    var amount : String
    var date : Date
    var category : String
    var note : String?
    
    init(
        name: String,
        amount: String,
        date: Date,
        category: String,
        description: String?
    ) {
        self.name = name
        self.amount = amount
        self.date = date
        self.category = category
        self.note = description
    }
}
