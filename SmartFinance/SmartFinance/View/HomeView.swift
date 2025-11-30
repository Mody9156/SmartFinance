//
//  HomeView.swift
//  SmartFinance
//
//  Created by Modibo on 25/11/2025.
//

import SwiftUI
import SwiftUICharts
import _SwiftData_SwiftUI

struct HomeView: View {
    @Bindable var homeViewModel : HomeViewModel
    @State var activeToggle: Bool = false
    @Query var transaction : [Transaction]
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading){
                HStack {
                    CustomImageSystem(image: "person.crop.circle.fill")
                    
                    Spacer()
                    
                    CustomImageSystem(image: "gearshape")
                }
                Text("Tableau de bord")
                    .foregroundStyle(Color("titleColor"))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                ZStack(alignment: .bottom) {
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
                        
                        VStack(alignment: .center) {
                            Text("Montant utilisé")
                                .foregroundStyle(Color("textColor"))
                            
                            Text("$\(String(format: "%.2f",homeViewModel.newBalance))")
                                .font(.title)
                                .foregroundStyle(.white)
                            
                            let updateDifference = homeViewModel.updateDifferenceWithLastMonth()
                            let displayDifference = homeViewModel.displayDifference()
                            
                            Label{
                                Text(displayDifference)
                                    .foregroundStyle(Color("textColor"))
                                
                            } icon:{
                                Image(systemName: updateDifference)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .frame(height: 50)
                            .foregroundStyle(.green)
                            .opacity(0.9)
                            .clipShape(RoundedRectangleLetAndRight(radius: 12))
                        
                        Button(action: {
                            
                        }) {
                            Label{
                                Text("Nouvelle transaction")
                                    .foregroundStyle(.white)
                            }icon:{
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 25,height: 25)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                }
                
                ZStack(alignment: .topTrailing){
                    RoundedRectangle(cornerRadius: 12)
                        .frame(height: 400)
                        .foregroundStyle(.white)
                        .shadow(radius: 12)
                    
                    LineView(data: [8,23,500,32,12,37,7,23,43], title: "", legend: "Totalité des dépenses")
                        .padding()
                    
                    HStack {
                        Text("Finance")
                            .fontWeight(.bold)
                        
                        Toggle(activeToggle ? "Semaine" : "Mois", isOn: $activeToggle)
                    }
                    .padding()
                }
               
                VStack {
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("Transaction récente")
                                .foregroundStyle(.secondary)
                                .padding()
                                VStack {
                                   
                                    HistoryCustoms(systemName: "cart.fill", name: "Auchant", price: 160.88)
                                    HistoryCustoms(systemName: "bag.fill", name: "Adidas", price: 90.77)
                                    HistoryCustoms(systemName: "cart.fill", name: "Adidas", price: 160.88)
                                    
                                }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct HistoryCustoms:View {
    var systemName: String
    var name: String
    var price: Double
    
    var body: some View {
        VStack {
            HStack{
                Circle()
                    .foregroundStyle(.green.opacity(0.4))
                    .frame(height: 50)
                    .overlay(content: {

                        Image(systemName: systemName)
                            .resizable()
                            .foregroundStyle(.green)
                            .frame(width: 25,height: 25)
                    })
                
                VStack {
                    HStack {
                        Text(name)
                        Spacer()
                        Text("Jun 1")
                    }
                    HStack {
                        Text("Salaray - Jun 1")
                        Spacer()
                        Text("+ \(String(format: "%.2f",price))€")
                    }
                }
            }
            .padding()
        }
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

struct RoundedRectangleLetAndRight: Shape {
    var radius: CGFloat = 20
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}


#Preview {
    HomeView(homeViewModel: HomeViewModel())
}
