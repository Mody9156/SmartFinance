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
                CustomImageSystem(image: "person.crop.circle.fill")
                
                Spacer()
            
                CustomImageSystem(image: "gearshape")
            }
            Text("Tableau de bord")
                .foregroundStyle(Color("titleColor"))
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                Color("containerColor_left"),
                                Color("containerColor_right")
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(height: 200)
                
                Text("Montant utilisé")
                    .foregroundStyle(Color("textColor"))
            }
            
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
