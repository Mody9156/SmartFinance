//
//  Category.swift
//  SmartFinance
//
//  Created by Modibo on 04/12/2025.
//

import Foundation

enum CategoryIcon: String, CaseIterable {
    // Dépenses
    case Alimentation
    case Logement
    case Transport
    case Santé
    case Divertissement
    case Éducation
    case Shopping
    case Voyages
    case Services
    case Autre
    case ImpotsEtTaxes = "Impôts et taxes"
    case Investissements
    case Épargne
    case Retrait

    // Revenus / transferts
    case Salaire
    case Revenu
    case Dépôt
    case virementRecu = "Virement reçu"
    case virementEnvoye = "Virement envoye"
    case transfertInterne = "Transfert interne"
    
    var icon: String {
        switch self {
        case .Alimentation: return "fork.knife"
        case .Logement: return "house.fill"
        case .Transport: return "car.fill"
        case .Santé: return "heart.fill"
        case .Divertissement: return "gamecontroller.fill"
        case .Éducation: return "book.fill"
        case .Shopping: return "bag.fill"
        case .Voyages: return "airplane"
        case .Services: return "wrench.and.screwdriver.fill"
        case .Autre: return "questionmark.circle"
        case .ImpotsEtTaxes: return "building.columns"
        case .Investissements: return "chart.line.uptrend.xyaxis"
        case .Épargne: return "banknote.fill"
        case .Retrait: return "creditcard"

        case .Salaire: return "dollarsign.circle.fill"
        case .Revenu: return "arrow.up.circle.fill"
        case .Dépôt: return "arrow.down.circle.fill"
        case .virementRecu: return "arrow.left.arrow.right.circle.fill"
        case .virementEnvoye: return "arrow.right.circle.fill"
        case .transfertInterne: return "arrow.left.arrow.right"
        }
    }
}
