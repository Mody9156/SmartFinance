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
                    .resizable()
                    .frame(width: 30,height: 30)
                    .foregroundStyle(Color("titleColor"))
                    .padding()
                
                Spacer()
                
                Image(systemName: "gearshape")
                    .resizable()
                    .frame(width: 30,height: 30)
                    .foregroundStyle(Color("titleColor"))
                    .padding()
            }
            Text("Tableau de bord")
                .foregroundStyle(Color("titleColor"))
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
        }
        .padding()
    }
}



struct CustomImageSystem:View {
    var image : String
    var body: some View {
        Image(systemName: image)
            .resizable()
            .frame(width: 30,height: 30)
            .foregroundStyle(Color("titleColor"))
            .padding()
    }
}

#Preview {
    HomeView()
}
