//
//  HomeView.swift
//  SmartFinance
//
//  Created by Modibo on 25/11/2025.
//

import SwiftUI
import SwiftUICharts

struct HomeView: View {
    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .foregroundStyle(Color("titleColor"))
                
                Spacer()
                
                Image(systemName: "gearshape")
            }
            Text("Tableau de bord")
                .foregroundStyle(Color("titleColor"))
                .fontWeight(.bold)
        }
    }
}

#Preview {
    HomeView()
}
