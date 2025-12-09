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
                
                ZStack {
                    ZStack(alignment: .bottomTrailing){
                        Circle()
                            .frame(width: 140, height: 140)
                            .background(.ultraThinMaterial)
                            .overlay(
                                Circle()
                                    .strokeBorder(Gradient(colors: [.white.opacity(0.8), .clear, .green.opacity(0.4)]), lineWidth: 2.5)
                            )
                            .shadow(color: .blue.opacity(0.18), radius: 10, x: 0, y: 3)
                        
                        ZStack {
                            Circle()
                                .foregroundStyle(.white)
                                .frame(height: 50)
                            
                            Image(systemName: "pencil")
                                .resizable()
                                .frame(width: 25,height: 25)
                        }
                           
                    }
                    
                    
                    Image("User")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 72, height: 72)
                        .clipShape(Circle())
                        .shadow(radius: 4, y: 2)
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

