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
        Text("Setting")
        
        Picker("Exchange Rate", selection: $selectedCurrency) {
            
        }
    }
}

#Preview {
    SettingView(addTransactionViewModel: AddTransactionViewModel())
}
