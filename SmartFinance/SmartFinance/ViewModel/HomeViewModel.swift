//
//  HomeViewModel.swift
//  SmartFinance
//
//  Created by Modibo on 24/11/2025.
//

import Foundation
import Observation
import SwiftData
import SwiftUI

@Observable
class HomeViewModel {
    private let context: ModelContext
    var items : [Item] = []
    
    init(context: ModelContext) {
        self.context = context
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
