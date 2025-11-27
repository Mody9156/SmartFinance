//
//  HomeView.swift
//  SmartFinance
//
//  Created by Modibo on 25/11/2025.
//

import SwiftUI
import SwiftUICharts

struct HomeView: View {
    @State var total: Double = 12.454
    @Bindable var homeViewModel : HomeViewModel
    
    var body: some View {
        
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
                            
                            Text("$\(homeViewModel.newBalance.rounded())")
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
    HomeView(homeViewModel: HomeViewModel())
}
