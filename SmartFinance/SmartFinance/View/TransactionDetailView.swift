//
//  TransactionDetailView.swift
//  SmartFinance
//
//  Created by Modibo on 18/12/2025.
//

import SwiftUI
import SwiftData

struct TransactionDetailView: View {
   var transaction : [Transactions]
    
    var body: some View {
        VStack(spacing: 16) {
            ForEach(transaction) { index in
                        
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Image(systemName:index.icon)
                                    .font(.largeTitle)
                                Text(index.name)
                                    .font(.title2)
                                    .bold()
                                Spacer()
                                Text(String(format: "%@%.2f", index.type, index.amount))
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(index.type == "+" ? .green : .red)
                            }
                            
                            HStack {
                                Text("Catégorie:")
                                    .bold()
                                Text(index.category)
                                Spacer()
                                Text(index.date, style: .date)
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                            }
                            
                            HStack {
                                Text("Description:")
                                    .bold()
                                Text(index.description)
                            }
                        }
                        .padding()
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(12)
                        .shadow(radius: 2)
                    }
                }
                .padding()
                .navigationTitle("Détails de la transaction")
    }
}

#Preview {
    
    @Previewable  var array =  [
        Transactions(name: "Adidas",
                     amount: 10.55,
                     date: Date(),
                     category: "Shop",
                     description: "Cadeau",
                     icon: "$",
                     type: "+")
    ]
    
    TransactionDetailView(
        transaction: array
    )
}
