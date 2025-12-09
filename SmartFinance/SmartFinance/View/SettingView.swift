//
//  SettingView.swift
//  SmartFinance
//
//  Created by Modibo on 25/11/2025.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("baseCurrency") var baseCurrency : String = "USA"
    @State var selectedCurrency : Int = 0
    var addTransactionViewModel : AddTransactionViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                
                ZStack{
                    Circle()
                        .frame(width: 50,height: 50)
                        .glassEffect()
                        .foregroundStyle(.gray)
                        .clipShape(Circle())
                    
                    Image("User")
                        .resizable()
                        .frame(width: 25,height: 25)
                        .foregroundStyle(.red)
                       
                }
                
                Section(header: Text("Paramètre")) {
                    Picker("Devise", selection: $selectedCurrency) {
                        if let firstCurrency = addTransactionViewModel.conversion.first {
                            let currencyKeys = firstCurrency.conversionRates.keys.sorted()
                            
                            ForEach(0..<currencyKeys.count, id: \.self) { values in
                                Text(currencyKeys[values]).tag(values)
                                    .onChange(of:values){
                                        baseCurrency = currencyKeys[values]
                                    }
                            }
                        }
                    }.pickerStyle(.navigationLink)
                }
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
