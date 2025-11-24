//
//  HomeViewModel.swift
//  SmartFinance
//
//  Created by Modibo on 24/11/2025.
//

import Foundation
import Observation
import SwiftUI
import SwiftData

@Observable
class HomeViewModel{
    var context: ModelContext
    var items : [Item]
    
    init(context: ModelContext, items: [Item]) {
        self.context = context
        self.items = items
    }
    private func addItem() {
            let newItem = Item(timestamp: Date())
            context.insert(newItem)
        
    }

    private func deleteItems(offsets: IndexSet) {
       
            for index in offsets {
                context.delete(items[index])
            }
        
    }
}
