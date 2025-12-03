//
//  SettingView.swift
//  SmartFinance
//
//  Created by Modibo on 25/11/2025.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("baseCurrency") var baseCurrency : Double = 0.0
    @State var selectedCurrency : Int = 0
    var addTransactionViewModel : AddTransactionViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Picker("Exchange Rate", selection: $selectedCurrency) {
                    if let firstCurrency = addTransactionViewModel.conversion.first {
                        let currencyKeys = Array(firstCurrency.conversionRates)
                        
                        ForEach(currencyKeys.enumerated(), id: \.offset) { values , keys in
                            Text(keys.key).tag(values)
                                .onChange(of:keys.value ){
                                    baseCurrency = keys.value
                                }
                        }
                    }
                }
                .pickerStyle(.navigationLink)
                
            }
            .padding()
            .task{
                await addTransactionViewModel.getConversions()
            }
        }
    }
}

#Preview {
    SettingView(addTransactionViewModel: AddTransactionViewModel())
}
