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
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
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
        }
    }
}

#Preview {
    AddTransactionView()
}
