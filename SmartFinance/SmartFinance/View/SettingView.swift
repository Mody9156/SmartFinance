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
        VStack {
            Text("Setting")
            Picker("Exchange Rate", selection: $selectedCurrency) {
                
            }
        }
        .onAppear{
            Task{
                try? await addTransactionViewModel.getConversions()
            }
        }
    }
}

#Preview {
    SettingView(addTransactionViewModel: AddTransactionViewModel())
}
