//
//  TransactionDetailView.swift
//  SmartFinance
//
//  Created by Modibo on 18/12/2025.
//

import SwiftUI
import SwiftData

struct TransactionDetailView: View {
    let transaction : Transactions
    
    var body: some View {
        VStack(spacing: 16) {
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName:transaction.icon)
                        .font(.largeTitle)
                    Text(transaction.name)
                        .font(.title2)
                        .bold()
                    Spacer()
                    Text(String(format: "%@%.2f", transaction.type, transaction.amount))
                        .font(.title3)
                        .bold()
                        .foregroundColor(transaction.type == "+" ? .green : .red)
                }
                
                HStack {
                    Text("Catégorie:")
                        .bold()
                    Text(transaction.category)
                    Spacer()
                    Text(transaction.date, style: .date)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                
                HStack {
                    Text("Description:")
                        .bold()
                    Text(transaction.note ?? "")
                }
            }
            .padding()
            .background(Color.green.opacity(0.2))
            .cornerRadius(12)
            .shadow(radius: 2)
        }
        .padding()
        .navigationTitle("Détails de la transaction")
    }
    
}

#Preview {
    
    @Previewable  let array =
        Transactions(name: "Adidas",
                     amount: 10.55,
                     date: Date(),
                     category: "Shop",
                     description: "Cadeau",
                     icon: "$",
                     type: "+")
    
    TransactionDetailView(
        transaction: array
    )
}
