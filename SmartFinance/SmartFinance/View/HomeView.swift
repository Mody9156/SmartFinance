//
//  HomeView.swift
//  SmartFinance
//
//  Created by Modibo on 25/11/2025.
//

import SwiftUI
import SwiftUICharts
import SwiftData

struct HomeView: View {
    @Bindable var homeViewModel : HomeViewModel
    @State var showWeekly: Bool = false
    @Query var transactions : [Transaction]
    @State var isPresentingAddTransaction : Bool = false
    @State var selectedIcon: String = ""
    @AppStorage("baseCurrency") var baseCurrency : String = "EUR"
    
    var body: some View {
        NavigationStack{
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
                                
                                Text(
                                    "\(String(format: "%.2f",homeViewModel.lastBalance)) \( homeViewModel.currencySymbol(element: baseCurrency))"
                                )
                                .font(.title)
                                .foregroundStyle(.white)
                                
                                let updateDifference = homeViewModel.updateDifferenceWithLastMonth()
                                //                                let displayDifference = homeViewModel.displayDifference()
                                
                                
                                Label{
                                    Text(
                                        "\(String(format: "%.2f",homeViewModel.newBalance)) \( homeViewModel.currencySymbol(element: baseCurrency)) ce mois"
                                    )
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
                                isPresentingAddTransaction = true
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
                            }.navigationDestination(isPresented: $isPresentingAddTransaction) {
                                AddTransactionView(addTransactionViewModel: AddTransactionViewModel())
                            }
                        }
                    }
                    
                    ZStack(alignment: .topTrailing){
                        RoundedRectangle(cornerRadius: 12)
                            .frame(height: 400)
                            .foregroundStyle(.white)
                            .shadow(radius: 12)
                        
                        LineView(
                            data: transactions.map(\.amount),
                            title: "",
                            legend: "Totalité des dépenses"
                        )
                        .padding()
                        
                        HStack {
                            Text("Finance")
                                .fontWeight(.bold)
                            
                            Toggle("Affichage hebdomadaire", isOn: $showWeekly)
                        }
                        .padding()
                    }
                    
                    LazyVStack {
                        ScrollView {
                            VStack(alignment: .leading) {
                                Text("Transaction récente")
                                    .foregroundStyle(.secondary)
                                    .padding()
                                VStack {
                                    ForEach(transactions.prefix(3)){ item in
                                        TransactionRow(
                                            name: item.name,
                                            systemName: item.icon,
                                            date: item.date,
                                            category: item.category,
                                            amount: item.amount,
                                            homeViewModel: homeViewModel
                                        )
                                    }
                                }
                            }
                            
                        }
                    }
                    .onChange(of: transactions){
                        homeViewModel.UpdateBalance(transaction: transactions)
                    }
                    .padding()
                }
            }
        }
    }
}

struct TransactionRow: View {
    var name:String
    var systemName:String
    var date:Date
    var category:String
    var amount:Double
    @Bindable var homeViewModel : HomeViewModel
    @AppStorage("baseCurrency") var baseCurrency : String = "EUR"
    
    var body: some View {
            HStack {
                ZStack {
                    Circle()
                        .frame(height: 50)
                        .foregroundStyle(Color("textColor"))
                    
                    Image(systemName: systemName)
                        .resizable()
                        .frame(width: 25,height: 25)
                        .foregroundStyle(Color("titleColor"))
                }
                
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.title3)
                        .fontWeight(.bold)
                    HStack {
                        Text("\(category) -")
                            .font(.caption)
                        
                        Text(date, format: .dateTime.day().month())
                            .font(.caption)
                    }
                }
                .padding()
                
                Spacer()
                
    //            let ColorAmount = amount.contains("-")
                
    //            Text("\(amount) \( homeViewModel.selectedCurrencySymbolse(element: baseCurrency))")
    //
                Text(
                    amount,
                    format: .currency(code: homeViewModel.currencySymbol(element: baseCurrency))
                
                )
                    .foregroundStyle(amount < 0 ? .red : .green)
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

