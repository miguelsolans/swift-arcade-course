//
//  DecimalUtil.swift
//  Bankey
//
//  Created by Miguel Solans on 13/11/2022.
//

import Foundation

extension Decimal {
    // We add a computed property as an extension to Decimal call
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
