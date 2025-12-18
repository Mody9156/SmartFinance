//
//  TransactionDetailView.swift
//  SmartFinance
//
//  Created by Modibo on 18/12/2025.
//

import SwiftUI
import _SwiftData_SwiftUI

struct TransactionDetailView: View {
    let transaction : [Transactions] 
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    TransactionDetailView(
        transaction: [Transactions(name: "Adidas", amount: 10.55, date: Date(), category: "Shop", description: "Cadeau", icon: "$", type: "+")]
    )
}
