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
    @State var selectElement_3 = 0
    @State var catagory: String = ""
    @State var note: String = ""
    @State var date : Date = Date()
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
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
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Nom et montant")) {
                        TextField("Nom de l'achat", text: $name)
                            .textContentType(.name)
                        
                        TextField("Montant de l'achat", value: $amount, format: .number)
                            .keyboardType(.decimalPad)
                        
                        DatePicker("Date", selection: $date)
                        
                        Picker(selection: $selectElement_3) {
                            ForEach(0..<showCategory.count,id: \.self){ items in
                                Text(self.showCategory[items])
                            }
                        } label: {
                            Text("Catgories")
                        }
                        .pickerStyle(.navigationLink)
                        
                        
                       
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
        }
    }
}

#Preview {
    AddTransactionView()
}
