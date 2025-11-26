//
//  HomeView.swift
//  SmartFinance
//
//  Created by Modibo on 25/11/2025.
//

import SwiftUI
import SwiftUICharts

struct HomeView: View {
    var demoData: [Double] = [8,23,54,32,12,37,7,23,43]
    @State var name : String = "Jimmy"
    @State var total : Int = 12_111
    var body: some View {
        
        ZStack{
            LinearGradient(
                colors: [Color.white,Color.green],
                startPoint: .bottom,
                endPoint: .top
            )
            .ignoresSafeArea()
            
            VStack {
                Text("Bienvenue \(name)")
                    .foregroundStyle(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                
                Text("$\(total)")
                    .foregroundStyle(.white)
                    .font(.title2)
                    .padding()
                LineChartView(data: demoData, title: "Title", legend: "Legendary")
                
              
                    
                    Button(action:{
                        
                    },label:{
                        Text("Explorer")
                            .foregroundStyle(.white)
                    })
                    .padding()
                    .background(.green)
                    .clipShape(Capsule())
                        
            }
        }
    }
}

#Preview {
    HomeView()
}
