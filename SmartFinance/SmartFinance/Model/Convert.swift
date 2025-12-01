//
//  convert.swift
//  SmartFinance
//
//  Created by Modibo on 01/12/2025.
//

import Foundation

struct Convert : Decodable,Hashable {
       let result: String
       let documentation, termsOfUse: String
       let timeLastUpdateUnix: Int
       let timeLastUpdateUTC: String
       let timeNextUpdateUnix: Int
       let timeNextUpdateUTC, baseCode: String
       let conversionRates: [String: Double]
}

