//
//  HomeView.swift
//  SmartFinance
//
//  Created by Modibo on 25/11/2025.
//

import SwiftUI
import SwiftUICharts

struct HomeView: View {
    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
  
    var body: some View {
        
        ScrollView {
            VStack {
                
                Text("SmartFinance")
                
                //                LineView(data: [8,23,54,32,12,37,7,23,43], title: "Line chart", legend: "Full screen") // legend is optional, use optional .padding()
                //
                
                LineChartView(data: [8,23,54,32,12,37,7,23,43], title: "Title", legend: "Legendary") // legend is optional
                
                
                
                BarChartView(data: ChartData(points:[1.23,2.43,3.37]) ,title: "A", valueSpecifier: "%.2f")
                
                PieChartView(data: [8,23,54,32], title: "Title", legend: "Legendary") // legend is optional
                
                MultiLineChartView(data: [([8,32,11,23,40,28], GradientColors.green), ([90,99,78,111,70,60,77], GradientColors.purple), ([34,56,72,38,43,100,50], GradientColors.orngPink)], title: "Evolution")
                
               
            }
        }
    }
}

#Preview {
    HomeView()
}
