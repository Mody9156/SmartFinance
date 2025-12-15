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
    var amount : Double
    var date : Date
    var category : String
    var note : String?
    var icon: String
    var type : String
    
    init(
        name: String,
        amount: Double,
        date: Date,
        category: String,
        description: String?,
        icon: String,
        type : String
    ) {
        self.name = name
        self.amount = amount
        self.date = date
        self.category = category
        self.note = description
        self.icon = icon
        self.type = type
    }
}
