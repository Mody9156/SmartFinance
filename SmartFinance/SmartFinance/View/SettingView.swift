//
//  SettingView.swift
//  SmartFinance
//
//  Created by Modibo on 25/11/2025.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("baseCurrency") var baseCurrency : String = ""
    @State var selectedCurrency : String = ""
    var addTransactionViewModel : AddTransactionViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Setting")
                Picker("Exchange Rate", selection: $selectedCurrency) {
                    
                    if let firstCurrency = addTransactionViewModel.conversion.first {
                        let currency = Array(firstCurrency.conversionRates.keys)
                        
                        ForEach(currency.enumerated(), id: \.offset) { values , keys in
                            Text(keys).tag(values)
                        }
                        
                    }
                    
                }
                .pickerStyle(.navigationLink)
            }
            .onAppear{
                Task{
                    try? await addTransactionViewModel.getConversions()
                }
            }
        }
    }
}

#Preview {
    SettingView(addTransactionViewModel: AddTransactionViewModel())
}
