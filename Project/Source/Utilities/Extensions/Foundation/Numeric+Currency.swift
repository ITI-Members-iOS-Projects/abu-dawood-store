//
//  FloatExtension.swift
//  DD-Foundation
//
//  Created by Mohamed Gamal on 8/16/18.
//

import Foundation

public extension Numeric {
    func formattedAmount(numberStyle: NumberFormatter.Style = .currency, currencySympol: String? = nil, maximumFationDigts: Int = 2 ) -> String? {
        guard let number = self as? NSNumber else {
            return nil
        }
        
        let formater = NumberFormatter()
        formater.locale = Locale.current
        formater.numberStyle = numberStyle
        formater.currencySymbol = currencySympol ?? ""
        formater.maximumFractionDigits = maximumFationDigts
        let formatedSting = formater.string(from: number)?.stripped
        
        return formatedSting ?? nil
    }
}
