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
  
    var body: some View {
        
        ScrollView {
            ZStack {
//                Text("SmartFinance")
                LineChartView(data: demoData, title: "Title", legend: "Legendary") // legend is optional
            }
        }
    }
}

#Preview {
    HomeView()
}
