//
//  Category.swift
//  SmartFinance
//
//  Created by Modibo on 04/12/2025.
//

import Foundation

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let type: CategoryType
}

enum CategoryType {
    case expense
    case income
}

let categories: [Category] = [

    // MARK: - Dépenses
    Category(name: "Alimentation",       icon: "fork.knife",                   type: .expense),
    Category(name: "Logement",           icon: "house.fill",                   type: .expense),
    Category(name: "Transport",          icon: "car.fill",                     type: .expense),
    Category(name: "Santé",              icon: "cross.case.fill",              type: .expense),
    Category(name: "Divertissement",     icon: "film.fill",                    type: .expense),
    Category(name: "Éducation",          icon: "graduationcap.fill",           type: .expense),
    Category(name: "Shopping",           icon: "bag.fill",                     type: .expense),
    Category(name: "Voyages",            icon: "airplane",                     type: .expense),
    Category(name: "Services",           icon: "wrench.and.screwdriver",       type: .expense),
    Category(name: "Autre",              icon: "ellipsis.circle.fill",         type: .expense),
    Category(name: "Impôts et taxes",    icon: "doc.text.fill",                type: .expense),
    Category(name: "Investissements",    icon: "chart.line.downtrend.xyaxis",  type: .expense),
    Category(name: "Épargne",            icon: "safe.fill",                    type: .expense),
    Category(name: "Retrait",            icon: "banknote.fill",                type: .expense),

    // MARK: - Revenus
    Category(name: "Salaire",            icon: "briefcase.fill",               type: .income),
    Category(name: "Revenu",             icon: "banknote",                     type: .income),
    Category(name: "Dépôt",              icon: "arrow.down.circle.fill",       type: .income),
    Category(name: "Virement reçu",      icon: "arrow.down.left.circle.fill",  type: .income)
]
