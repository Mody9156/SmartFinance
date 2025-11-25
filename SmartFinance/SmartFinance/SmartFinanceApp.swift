//
//  SmartFinanceApp.swift
//  SmartFinance
//
//  Created by Modibo on 22/11/2025.
//

import SwiftUI
import SwiftData

@main
struct SmartFinanceApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Accueil", systemImage: "house") {
                    HomeView()
                }
                Tab("Transaction", systemImage: "chart.bar.xaxis.ascending") {
                    TransactionsView()
                }
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
