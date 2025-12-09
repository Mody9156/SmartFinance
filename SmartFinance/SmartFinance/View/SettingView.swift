//
//  SettingView.swift
//  SmartFinance
//
//  Created by Modibo on 25/11/2025.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("baseCurrency") var baseCurrency : String = "USA"
    @State var selectedCurrency : String = ""
    @State var selectedLinkedAcconts : String = ""
    var addTransactionViewModel : AddTransactionViewModel
    @State private var activeNotification: Bool = false
    @State private var activeDarkMode: Bool = false
    @State private var modification_of_the_profile: Bool = false
    
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
                                .font(.largeTitle)
                            
                                Text("emailexemple.com")
                                .foregroundStyle(.white)
                            

                        }
                    }
                }
                
                Section(header: Text("Compte")) {
                    
                    Picker("compte lié", selection: $selectedLinkedAcconts) {
                        
                        
                    }
                    
                    Picker("Devise", selection: $selectedCurrency) {
                        if let firstCurrency = addTransactionViewModel.conversion.first {
                            let currencyKeys = firstCurrency.conversionRates.keys.sorted()
                            
                            ForEach(currencyKeys, id: \.self) { values in
                                Text(values).tag(values)
                                    .onChange(of:values){
                                        baseCurrency = values
                                    }
                            }
                        }
                    }
                    .padding()
                    .pickerStyle(.navigationLink)
                }
                .padding()
                
                Section(header: Text("Paramètres")) {
                    HStack {
                        Image(systemName: activeNotification ? "bell.fill" : "bell")
                        
                        Toggle(
                            "Notifications",
                            isOn: $activeNotification
                        )
                    }
                    
                    HStack {
                        Image(systemName: activeDarkMode ? "moon.fill" : "moon")
                        
                        Toggle(
                            "Notifications",
                            isOn: $activeDarkMode
                        )
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

