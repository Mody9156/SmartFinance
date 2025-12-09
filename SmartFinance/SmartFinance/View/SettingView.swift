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
    @State private var activeToggle: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ZStack {
                    Color.green.ignoresSafeArea()
                    
                    VStack {
                        ZStack(alignment: .bottomTrailing){
                            ZStack{
                                
                                Circle()
                                    .frame(width: 140, height: 140)
                                    .foregroundStyle(.ultraThinMaterial)
                                    .overlay(
                                        Circle()
                                            .strokeBorder(Gradient(colors: [.white.opacity(0.8), .clear, .green.opacity(0.4)]), lineWidth: 2.5)
                                    )
                                    .shadow(color: .green.opacity(0.18), radius: 10, x: 0, y: 3)
                                
                                Image("User")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 72, height: 72)
                                    .clipShape(Circle())
                                    .shadow(radius: 4, y: 2)
                            }
                            
                            Button(action:{
                                
                            }) {
                                ZStack {
                                    Circle()
                                        .foregroundStyle(.white)
                                        .frame(height: 50)
                                    
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .foregroundStyle(.black)
                                        .frame(width: 25,height: 25)
                                }
                            }
                        }
                        
                        VStack {
                            Text("Name")
                                .foregroundStyle(.white)
                                .font(.title3)

                        }
                    }
                }
                
                Section(header: Text("Compte")) {
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
                    }
                    .padding()
                    .pickerStyle(.navigationLink)
                    
                }
                .padding()
                
                Section(header: Text("Paramètre")) {
                    HStack {
                        Toggle("Notifications", isOn: $activeToggle)
                    }
                }
                .padding()
            }
             .task{
                await addTransactionViewModel.getConversions()
            }
        }
    }
}
#Preview {
    SettingView(addTransactionViewModel: AddTransactionViewModel())
}

