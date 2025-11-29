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
    @State var from: [String] = ["$","€"]
    @State var selectElement = 1
    @State var selectElement_2 = 1
    @State var date : Date = Date()
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Nom et montant")) {
                    TextField("Nom de l'achat", text: $name)
                        .textContentType(.name)
                    if name.isEmpty {
                        Text("Le nom est requis").foregroundStyle(.red)
                    }

                    TextField("Montant de l'achat", value: $amount, format: .number)
                        .keyboardType(.decimalPad)
                    if amount <= 0 {
                        Text("Le montant doit être supérieur à 0").foregroundStyle(.red)
                    }
                    
                    DatePicker("Date", selection: $date)
                    
                }
                
                
                
                
                Section(header:Text("Conversion")) {
                  
                        Picker(selection: $selectElement) {
                            ForEach(0..<from.count,id: \.self){ from in
                                Text(self.from[from])
                            }
                        } label: {
                            Text("From")
                        }
                        .pickerStyle(.navigationLink)
                        
                    Picker(selection: $selectElement_2) {
                        ForEach(0..<from.count,id: \.self){ from in
                            Text(self.from[from])
                        }
                    } label: {
                        Text("To")
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Button(action: {
                    
                },label:{
                    VStack(alignment: .center) {
                        Text("Valider")
                            
                    }
                })
            }
        }
    }
}

#Preview {
    AddTransactionView()
}
