//
//  AddTransactionView.swift
//  SmartFinance
//
//  Created by Modibo on 27/11/2025.
//

import SwiftUI

struct AddTransactionView: View {
    @State var name: String = ""
    @State var amount: Double = 0.0
    @State var conversion: [String] = ["$","€"]
    @State var selectElement = 1
    @State var selectElment_2 = 1
    @State var selectCategory = 0
    @State var catagory: String = ""
    @State var note: String = ""
    @State var date : Date = Date()
    @State var activeToggle: Bool = false
    @State var showCategory: [String] = [
        "Alimentation",
        "Logement",
        "Transport",
        "Santé",
        "Divertissement",
        "Éducation",
        "Shopping",
        "Voyages",
        "Services",
        "Autre"
    ]
    @AppStorage("baseCurrency") var baseCurrency : Double = 0.0
    var addTransactionViewModel : AddTransactionViewModel
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    func exchangeRate(amount:Double,to targetCurrency:Double) -> Double {
       
         let amountInBase = amount / baseCurrency
         let convertedAmount = amountInBase * baseCurrency
        
         return convertedAmount
        
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Nouvelle transaction"),
                            footer: Text("Veuillez remplir tous les champs pour ajouter une transaction.")) {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Nom")
                            
                            TextField("Nom de l'achat", text: $name)
                                .textContentType(.name)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Montant")
                            
                            TextField("Entrez le montant",
                                      value: $amount,
                                      format: .number.precision(.fractionLength(2)))
                            .keyboardType(.decimalPad)
                            
                        }
                        
                        DatePicker("Date", selection: $date)
                        
                        Picker(selection: $selectCategory) {
                            ForEach(0..<showCategory.count,id: \.self){ items in
                                Text(self.showCategory[items])
                            }
                        } label: {
                            Text("Catgories")
                        }
                        .pickerStyle(.navigationLink)
                        
                        HStack {
                            Text("Note")
                            
                            TextEditor(text: $note)
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                .foregroundStyle(.primary)
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(.systemGray6))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.secondary.opacity(0.2), lineWidth: 1)
                                )
                                .padding(.horizontal)
                        }
                    }
                    
                    Toggle(isOn: $activeToggle) {
                        Text("Activation de la conversion")
                    }
                    
                    if activeToggle {
                        Section(header:Text("Conversion")) {
                            if let firstConvert = addTransactionViewModel.conversion.first {
                                let codes = Array(firstConvert.conversionRates.keys)
                                Picker("De", selection: $selectElement) {
                                    ForEach(Array(codes.enumerated()), id: \.offset) { index, code in
                                        Text(code).tag(index)
                                    }
                                }
                                .pickerStyle(.navigationLink)
                            }
                        }
                    }
                }
                
                Button(action: {
                    
                },label:{
                    VStack(alignment: .center) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(height: 50)
                                .foregroundStyle(Color("containerColor_right"))
                            
                            Text("Valider")
                                .foregroundStyle(.white)
                        }
                    }
                })
                .padding()
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
    AddTransactionView(addTransactionViewModel: AddTransactionViewModel())
}
