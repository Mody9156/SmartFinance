//
//  Category.swift
//  SmartFinance
//
//  Created by Modibo on 04/12/2025.
//

import Foundation

enum CategoryIcon: String {
    // Dépenses
    case alimentation
    case logement
    case transport
    case sante
    case divertissement
    case education
    case shopping
    case voyages
    case services
    case autre
    case impots
    case investissements
    case epargne
    case retrait

    // Revenus
    case salaire
    case revenu
    case depot
    case virementRecu

    var icon: String {
        switch self {
        case .alimentation: return "fork.knife"
        case .logement: return "house.fill"
        case .transport: return "car.fill"
        case .sante: return "heart.fill"
        case .divertissement: return "gamecontroller.fill"
        case .education: return "book.fill"
        case .shopping: return "bag.fill"
        case .voyages: return "airplane"
        case .services: return "wrench.and.screwdriver.fill"
        case .autre: return "questionmark.circle"
        case .impots: return "banknote"
        case .investissements: return "chart.line.uptrend.xyaxis"
        case .epargne: return "banknote.fill"
        case .retrait: return "creditcard"
            
        case .salaire: return "dollarsign.circle.fill"
        case .revenu: return "arrow.up.circle.fill"
        case .depot: return "arrow.down.circle.fill"
        case .virementRecu: return "arrow.left.arrow.right.circle.fill"
        }
    }
}


