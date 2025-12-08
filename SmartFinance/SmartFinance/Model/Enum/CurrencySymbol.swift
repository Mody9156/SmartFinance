//
//  CurrencySymbol.swift
//  SmartFinance
//
//  Created by Modibo on 08/12/2025.
//

import Foundation

enum CurrencySymbol: String, CaseIterable {
    case USD, AED, AFN, ALL, AMD, ANG, AOA, ARS, AUD, AWG, AZN
    case BAM, BBD, BDT, BGN, BHD, BIF, BMD, BND, BOB, BRL, BSD
    case BTN, BWP, BYN, BZD, CAD, CDF, CHF, CLF, CLP, CNH, CNY
    case COP, CRC, CUP, CVE, CZK, DJF, DKK, DOP, DZD, EGP, ERN
    case ETB, EUR, FJD, FKP, FOK, GBP, GEL, GGP, GHS, GIP, GMD
    case GNF, GTQ, GYD, HKD, HNL, HRK, HTG, HUF, IDR, ILS, IMP
    case INR, IQD, IRR, ISK, JEP, JMD, JOD, JPY, KES, KGS, KHR
    case KID, KMF, KRW, KWD, KYD, KZT, LAK, LBP, LKR, LRD, LSL
    case LYD, MAD, MDL, MGA, MKD, MMK, MNT, MOP, MRU, MUR, MVR
    case MWK, MXN, MYR, MZN, NAD, NGN, NIO, NOK, NPR, NZD, OMR
    case PAB, PEN, PGK, PHP, PKR, PLN, PYG, QAR, RON, RSD, RUB
    case RWF, SAR, SBD, SCR, SDG, SEK, SGD, SHP, SLE, SLL, SOS
    case SRD, SSP, STN, SYP, SZL, THB, TJS, TMT, TND, TOP, TRY
    case TTD, TVD, TWD, TZS, UAH, UGX, UYU, UZS, VES, VND, VUV
    case WST, XAF, XCD, XCG, XDR, XOF, XPF, YER, ZAR, ZMW, ZWG, ZWL

    var symbol: String {
        switch self {
        case .USD, .BMD, .BSD, .HTG: return "$"
        case .EUR: return "€"
        case .GBP, .FKP, .GGP, .JEP, .SHP: return "£"
        case .JPY: return "¥"
        case .CNY, .CNH: return "¥"
        case .KRW: return "₩"
        case .INR, .BTN, .NPR: return "₹"
        case .RUB: return "₽"
        case .ILS: return "₪"
        case .THB: return "฿"
        case .VND: return "₫"
        case .NGN: return "₦"
        case .GHS: return "₵"
        case .UAH: return "₴"
        case .KZT: return "₸"
        case .GEL: return "₾"
        case .TRY: return "₺"
        case .AZN: return "₼"
        case .KHR: return "៛"
        case .LAK: return "₭"
        case .MNT: return "₮"
        case .PGK: return "K"
        case .AUD, .TVD: return "A$"
        case .NZD: return "NZ$"
        case .CAD: return "C$"
        case .MXN: return "MX$"
        case .HKD: return "HK$"
        case .SGD: return "S$"
        case .XCD: return "EC$"
        case .XAF, .XOF: return "FCFA"
        case .MAD: return "د.م."
        case .DZD: return "دج"
        case .TND: return "د.ت"
        case .EGP: return "ج.م"
        case .AED: return "د.إ"
        case .QAR: return "ر.ق"
        case .SAR: return "ر.س"
        case .KWD: return "د.ك"
        case .BHD: return "ب.د"
        case .OMR: return "ر.ع"
        case .IRR: return "﷼"
        case .IQD: return "ع.د"
        case .LBP: return "ل.ل"
        case .SYP: return "£S"
        case .MUR: return "₨"
        case .LKR: return "₨"
        case .PKR: return "₨"
        case .SCR: return "₨"
        case .ILS: return "₪"

        // Devises sans symbole officiel → on renvoie le code
        default: return self.rawValue
        }
    }
}
