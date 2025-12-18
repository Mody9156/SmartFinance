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
    @Query var transaction : [Transactions]
    @State var activeNavigationLink: Bool = false
    var transactionViewModel: TransactionViewModel
    @State var search : String = ""
    @AppStorage("baseCurrency") var baseCurrency : String = "EUR"
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(searchable) { transaction in
                    NavigationLink {
                       
                        TransactionDetailView(transaction: transaction)
                    } label: {
                        CustomLabel(
                            name: transaction.name,
                            systemName: transaction.icon,
                            date: transaction.date,
                            category: transaction.category,
                            amount: transaction.amount,
                            symbole: baseCurrency,
                            type: transaction.type,
                            transactionViewModel: transactionViewModel
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
    
    var searchable: [Transactions] {
        guard !search.isEmpty else { return transaction }

        return transaction.filter {
            $0.name.localizedCaseInsensitiveContains(search) ||
            $0.category.localizedCaseInsensitiveContains(search) ||
            String($0.amount).localizedCaseInsensitiveContains(search) ||
            DateFormatter.localizedString(
                from: $0.date,
                dateStyle: .short,
                timeStyle: .none
            ).contains(search)
        }
    }
    
    //Toujours supprimer ce qui est affiché, pas la source brute.
    private func deleteItems(offsets: IndexSet) {
            withAnimation {
                for index in offsets {
                    let item = searchable[index]
                    modelContext.delete(item)
                }
            }
    }
}

struct CustomLabel : View  {
    var name:String
    var systemName:String
    var date:Date
    var category:String
    var amount:Double
    var symbole:String
    var type: String
    var transactionViewModel: TransactionViewModel
    @AppStorage("baseCurrency") var baseCurrency : String = "EUR"
    
    var body: some View {
       
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
                
                Spacer()
               
                HStack{
                    Text(type)
                        .foregroundStyle(
                            transactionViewModel.updateForegroundColor(item: category)
                        )

                    Text(
                        amount,
                        format:
                                .currency(code: symbole)
                                .locale(Locale.autoupdatingCurrent)
                    )
                    .foregroundStyle(
                        transactionViewModel.updateForegroundColor(item: category)
                    )
                }
                
            }
        }
}

#Preview {
    TransactionsView(transactionViewModel: TransactionViewModel())
        .modelContainer(for: Transactions.self, inMemory: true)
}
