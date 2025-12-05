//
//  ContentView.swift
//  SmartFinance
//
//  Created by Modibo on 22/11/2025.
//

import SwiftUI
import SwiftData

struct TransactionsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var transaction : [Transaction]
    var transactions : [Transaction] = [Transaction(name: "Nike", amount: "-150", date: Date(), category: "SHOP", description: "rien", icon: "moon.stars.fill")]
    
    @State var activeNavigationLink: Bool = false

    var body: some View {
        NavigationStack{
            List {
                ForEach(transactions) { transaction in
                    NavigationLink {
                        
                        Text("Item at \(transaction.date, format: Date.FormatStyle(date: .numeric, time: .standard))")
                       
                    } label: {
                        CustomLabel(
                            systemName: transaction.name,
                            date: transaction.date,
                            category: transaction.category,
                            amount: transaction.amount
                        )
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationDestination(isPresented: $activeNavigationLink) {
                AddTransactionView(addTransactionViewModel: AddTransactionViewModel())
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        activeNavigationLink.toggle()
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(transaction[index])
            }
        }
    }
}

extension TransactionsView {
    func CustomLabel(systemName:String,date:Date, category:String, amount:String) -> some View {
        HStack {
            ZStack {
                Circle()
                    .frame(height: 20)
                    .foregroundStyle(.green)
                
                Image(systemName: systemName)
                    .foregroundStyle(.green)
            }
            
            Text(date, format: .dateTime.day().month())
            Text(amount)
        }
    }
}



#Preview {
    TransactionsView()
        .modelContainer(for: Transaction.self, inMemory: true)
}
