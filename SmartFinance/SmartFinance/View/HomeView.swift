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
    @State var activeNavigation : Bool = false
    var transactions : [Transaction]  = [
        Transaction(
          name: "Groceries",
          amount: "+45.50",
          date: Date(), // Uses the current date and time
          category: "Food",
          description: "Weekly shop at local supermarket.",
          icon: "cart.fill" // Example SFSymbol name
        ),
        Transaction(
          name: "Bus Fare",
          amount: "+2.80",
          date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, // Uses yesterday's date
          category: "Transport",
          description: nil, // Optional field, can be set to nil
          icon: "bus.fill"
        )
      ]
//    
//    func formatter() -> String {
//        guard let firstDate = transaction.first?.date else {
//            return ""
//        }
//        let formatDate = DateFormatter()
//        formatDate.dateFormat = "MM"
//        let result = formatDate.string(from: firstDate)
//        print("result \(result)")
//        return result
//    }
    
    
    func selectedPeriod(date:Date) -> Bool {
        let dateNow = Date()
        let dateFromatter = DateFormatter()
        dateFromatter.dateFormat = "MM"
        let currentMonth = dateFromatter.string(from: dateNow)
        let transactionMonth = dateFromatter.string(from: date)
        return currentMonth == transactionMonth
    }
    
     func cleanedAmounts(transaction : [Transaction]) -> [Double] {
        let result = transaction.map{homeViewModel.cleanSign(amount:$0.amount)}
        
        return result

    }
    

    func resultInThemounth(transaction : [Transaction]) -> Double{
        let amount = transaction.map{homeViewModel.cleanSign(amount:$0.amount)}
        let result = amount.reduce(0,+)
        print("reuslt:\(result)")
        homeViewModel.newBalance = result
        homeViewModel.lastBalance = result
        return result
    }
    
    
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
                                    "\(String(format: "%.2f",homeViewModel.lastBalance))"
                                )
                                    .font(.title)
                                    .foregroundStyle(.white)
                                
                                let updateDifference = homeViewModel.updateDifferenceWithLastMonth()
                                let displayDifference = homeViewModel.displayDifference()
                                
                                Label{
                                    Text(
                                        "\(String(format: "%.2f",homeViewModel.newBalance)) ce mois"
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
                                activeNavigation = true
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
                            }.navigationDestination(isPresented: $activeNavigation) {
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
                            data: cleanedAmounts(transaction: transactions),
                            title: "",
                            legend: "Totalité des dépenses"
                        )
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
                                    ForEach(transactions.prefix(3)){ item in
                                        CustomLabel(
                                            name: item.name,
                                            systemName: item.icon,
                                            date: item.date,
                                            category: item.category,
                                            amount: item.amount
                                        )
                                    }
                                }
                            }
                        }
                    }
                }
                .onAppear{
                    resultInThemounth(transaction: transactions)
                }
                .padding()
            }
        }
    }
}

extension HomeView {
    func CustomLabel(name:String,systemName:String,date:Date, category:String, amount:String) -> some View {
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
            
            let ColorAmount = amount.contains("-")
            
            Text(amount)
                .foregroundStyle(ColorAmount ? .red : .green)
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

