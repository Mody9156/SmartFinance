//
//  SettingView.swift
//  SmartFinance
//
//  Created by Modibo on 25/11/2025.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("baseCurrency") var baseCurrency : String = ""
    @State var selectedCurrency : Int = 0
    var addTransactionViewModel : AddTransactionViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
              
                Picker("Exchange Rate", selection: $selectedCurrency) {
                    
                    if let firstCurrency = addTransactionViewModel.conversion.first {
                        let currencyKeys = Array(firstCurrency.conversionRates.keys)
                        
                        ForEach(currencyKeys.enumerated(), id: \.offset) { values , keys in
                            Text(keys).tag(values)
                                .onChange(of:keys ){
                                    baseCurrency = keys
                                }
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
