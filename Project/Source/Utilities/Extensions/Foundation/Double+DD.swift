//
//  Double+DD.swift
//  Foundation-DD
//
//  Created by Mohamed Gamal on 10/24/19.
//

import UIKit

public extension Double {
    func miliSecondsToStringDate(formate: String) -> String {
        let date = Date(timeIntervalSince1970: (self / 1000.0))
        print(date)
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = formate
        
        if let date = dateFormatterGet.date(from: dateFormatterGet.string(from: date)) {
            return dateFormatterPrint.string(from: date)
        } else {
            assertionFailure("worng date Formate")
        }
        
        return ""
    }
    
    func secondsToStringDate(formate: String) -> String {
        let date = Date(timeIntervalSince1970: (self))
        print(date)
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = formate
        
        if let date = dateFormatterGet.date(from: dateFormatterGet.string(from: date)) {
            return dateFormatterPrint.string(from: date)
        } else {
            assertionFailure("worng date Formate")
        }
        
        return ""
    }
    
    func currencyFormate(currency: String = "$") -> String {
       return String(format: currency + "%.02f", self)
    }
}
