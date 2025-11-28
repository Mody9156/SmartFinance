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
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header:Text("Informations de l'achat")) {
                    TextField("Veuillez entrez le nom du de l'achat",
                              text: $name)
                    TextField(
                        "Veuillez entrez le montant de l'achat",
                        value:$amount,
                        formatter:formatter
                    )
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
                    Text("Valider")
                })
            }
        }
    }
}

#Preview {
    AddTransactionView()
}
