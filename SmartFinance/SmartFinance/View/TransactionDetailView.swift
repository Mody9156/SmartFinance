//
//  TransactionDetailView.swift
//  SmartFinance
//
//  Created by Modibo on 18/12/2025.
//

import SwiftUI
import _SwiftData_SwiftUI

struct TransactionDetailView: View {
    @Query var transaction : [Transactions]
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    TransactionDetailView()
}
