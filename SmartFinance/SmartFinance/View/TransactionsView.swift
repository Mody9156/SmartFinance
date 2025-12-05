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
    @State var activeNavigationLink: Bool = false
    @State var search : String = ""
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(searchable) { transaction in
                    NavigationLink {
                        
                        Text("Item at \(transaction.date, format: Date.FormatStyle(date: .numeric, time: .standard))")
                        
                        
                    } label: {
                        CustomLabel(
                            name: transaction.name,
                            systemName: transaction.icon,
                            date: transaction.date,
                            category: transaction.category,
                            amount: transaction.amount
                        )
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .searchable(text: $search)
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
    
    var searchable: [Transaction] {
        let transactionsFilter = transaction.filter {
            $0.name.localizedCaseInsensitiveContains(search) ||
            $0.category.localizedCaseInsensitiveContains(search) ||
            DateFormatter.localizedString(from: $0.date, dateStyle: .short, timeStyle: .none).contains(search) ||
            $0.amount.localizedCaseInsensitiveContains(search)
        }
        guard !search.isEmpty else { return transaction }
        return transactionsFilter
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
    func CustomLabel(name:String,systemName:String,date:Date, category:String, amount:String) -> some View {
        HStack {
            ZStack {
                Circle()
                    .frame(height: 50)
                    .foregroundStyle(Color("textColor"))
                
                Image(systemName: systemName)
                    .resizable()
                    .frame(width: 25,height: 25)
                    .foregroundStyle(Color("titleColor"))
            }
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title3)
                    .fontWeight(.bold)
                HStack {
                    Text("\(category) -")
                        .font(.caption)
                    
                    Text(date, format: .dateTime.day().month())
                        .font(.caption)
                }
            }
            .padding()
            
            Spacer()
            
            let ColorAmount = amount.contains("-")
            
            Text(amount)
                .foregroundStyle(ColorAmount ? .red : .green)
        }
    }
}



#Preview {
    TransactionsView()
        .modelContainer(for: Transaction.self, inMemory: true)
}
