//
//  AddTransactionView.swift
//  SmartFinance
//
//  Created by Modibo on 27/11/2025.
//

import SwiftUI
import UIKit
import SwiftData

struct AddTransactionView: View {
    @State var name: String = ""
    @State var amount: Double = 0.0
    @State var currentConversion = ""
    @State var selectElment_2 : String = ""
    @State var selectElment : String = ""
    @State var currentConversion_2: String = ""
    @State var selectCategory : String = ""
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
        "Autre",
        "Virement reçu",
        "Virement envoyé",
        "Transfert interne",
        "Revenu",
        "Salaire",
        "Impôts et taxes",
        "Épargne",
        "Investissements",
        "Retrait",
        "Dépôt"
    ]
    @AppStorage("baseCurrency") var baseCurrency: String = "EUR"
    var addTransactionViewModel : AddTransactionViewModel
    @State var currency : String = ""
    @State var category: String = ""
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
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

                        Picker("Catgories",selection: $selectCategory) {
                            ForEach(showCategory,id: \.self){ items in
                                Text(items)
                            }
                        }
                        .onChange(of:selectCategory){
                            category = selectCategory
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
                        showconver
                    }
                }
                
                Button(
                    action: {
                        let icone = addTransactionViewModel.iconeType(
                            element: category.lowercased()
                        )
                        
                        let type = addTransactionViewModel.categoryType(
                            element: category
                        )
                        
                        
                        print("category:\(category.lowercased())")
                        print("icone:\(icone)")
                        
                        let newTransaction = Transaction(
                            name: name,
                            amount: "\(type)\(amount)",
                            date: date,
                            category: category,
                            description: note,
                            icon: icone
                        )
                        
                        modelContext.insert(newTransaction)
                        dismiss()
                    },
                    label:{
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
                
            }.task{
                await addTransactionViewModel.getConversions()
            }
        }
    }
}

extension AddTransactionView {
    var showconver:  some View  {
        Section(header: Text("Conversion")) {
            if let firstConvert = addTransactionViewModel.conversion {
                let codes = Array(firstConvert.conversionRates.keys).sorted()
                
                // Picker FROM
                CustomPicker(
                    name: "De",
                    selectElement:  $selectElment,
                    currentConversion: $currentConversion,
                    codes: codes
                )
                .onChange(of: currentConversion) {
                    baseCurrency = currentConversion
                }
                .pickerStyle(.navigationLink)
                
                // Picker TO
                CustomPicker(
                    name: "Vers",
                    selectElement: $selectElment_2,
                    currentConversion: $currentConversion_2,
                    codes: codes
                )
                .onChange(of: selectElment_2) {
                    currency = currentConversion_2
                    amount = addTransactionViewModel
                        .exchangeRate(
                            amount: amount,
                            to: currency,
                            baseCurrency: baseCurrency
                        )
                }
                .pickerStyle(.navigationLink)
            }
        }
    }
}


struct CustomPicker: View {
    var name : String
    @Binding var selectElement : String
    @Binding var currentConversion: String
    var codes: [Dictionary<String, Double>.Keys.Element]
    
    var body: some View {
        Picker(name, selection: $selectElement) {
            ForEach(
                codes,
                id: \.self
            ) { index in
                Text(index)
            }
        }
        .onChange(of:selectElement){
            currentConversion = selectElement
        }
    }
}


#Preview {
    AddTransactionView(addTransactionViewModel: AddTransactionViewModel())
}
