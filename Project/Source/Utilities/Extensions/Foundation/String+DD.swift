//
//  StringExtensoin.swift
//

import UIKit

public extension String {
    var composedCount : Int {
        var count = 0
        enumerateSubstrings(in: startIndex..<endIndex, options: .byComposedCharacterSequences) { _,_,_,_  in count += 1 }
        return count
    }
        
    var toLocale: Locale {
        return Locale(identifier: self)
    }
    
    var base64Decoded: String? {
        // https://github.com/Reza-Rg/Base64-Swift-Extension/blob/master/Base64.swift
        guard let decodedData = Data(base64Encoded: self) else { return nil }
        return String(data: decodedData, encoding: .utf8)
    }
    
    var base64Encoded: String? {
        // https://github.com/Reza-Rg/Base64-Swift-Extension/blob/master/Base64.swift
        let plainData = data(using: .utf8)
        return plainData?.base64EncodedString()
    }
    
    var toNSString: NSString { return self as NSString }
    
    var camelCased: String {
        let source = lowercased()
        let first = source[..<source.index(after: source.startIndex)]
        if source.contains(" ") {
            let connected = source.capitalized.replacingOccurrences(of: " ", with: "")
            let camel = connected.replacingOccurrences(of: "\n", with: "")
            let rest = String(camel.dropFirst())
            return first + rest
        }
        let rest = String(source.dropFirst())
        
        return first + rest
    }
    
    var countofWords: Int {
        let regex = try? NSRegularExpression(pattern: "\\w+", options: NSRegularExpression.Options())
        return regex?.numberOfMatches(in: self, options: NSRegularExpression.MatchingOptions(), range: NSRange(location: 0, length: self.count)) ?? 0
    }
    
    var countofParagraphs: Int {
        let regex = try? NSRegularExpression(pattern: "\\n", options: NSRegularExpression.Options())
        let str = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        return (regex?.numberOfMatches(in: str, options: NSRegularExpression.MatchingOptions(), range: NSRange(location: 0, length: str.count)) ?? -1) + 1
    }
    
    var hasLetters: Bool {
        return rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
    }
    
    var isBlank: Bool {
        let trimmed = trimmingCharacters(in: .whitespacesAndNewlines)
        
        return trimmed.isEmpty
    }
    
    var isValidEmail: Bool {
        // http://emailregex.com/
        let regex =
        "^[a-zA-Z0-9!#$%&*+\\/=?^_{|}~-]+(?:\\.[a-zA-Z0-9!#$%&*+\\/=?^_{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9]){1,}?$"
        return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    var stripped: String {
        let hex_A0_space = " "
        let hex_20_space = " "
        return self.replacingOccurrences(of: hex_A0_space, with: "")
                   .replacingOccurrences(of: hex_20_space, with: "")
    }
    
    var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func capitalizeFirst() {
        guard self.count > 0 else { return }
        self.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).capitalized)
    }
    
    mutating func lowercaseFirst() {
        guard self.count > 0 else { return }
        self.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).lowercased())
    }
    
    func split(_ separator: String) -> [String] {
        return self.components(separatedBy: separator).filter {
            !$0.trimmed.isEmpty
        }
    }
    
    func toInt() -> Int? {
        
        guard let num = NumberFormatter().number(from: self) else {
            return nil
        }
        
        return num.intValue
    }
    
    func toDouble() -> Double? {
        
        guard let num = NumberFormatter().number(from: self) else {
            return nil
        }
        
        return num.doubleValue
    }
    
    func toFloat() -> Float? {
        guard let num = NumberFormatter().number(from: self) else {
            return nil
        }
        
        return num.floatValue
    }
    
    func toBool() -> Bool? {
        let trimmedString = trimmed.lowercased()
        if trimmedString == "true" || trimmedString == "false" {
            return (trimmedString as NSString).boolValue
        }
        
        return nil
    }
    
    func toDate(fromFormate: String = "yyyy-MM-dd'T'HH:mm:ssZ", toFormate: String) -> String {
      
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = fromFormate
        let date = dateFormatterGet.date(from: self)!
              
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = toFormate
        
        if let date = dateFormatterGet.date(from: dateFormatterGet.string(from: date)) {
            return dateFormatterPrint.string(from: date)
        } else {
            assertionFailure("date formate is wrong")
        }
        
        return ""
    }
    
    
    func underline() -> NSAttributedString {
        let underlineString = NSAttributedString(string: self, attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        
        return underlineString
    }
    
    func bold(withFont font: UIFont) -> NSAttributedString {
        let boldString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: font])
        
        return boldString
    }
    
    func italic(withFont font: UIFont) -> NSAttributedString {
        let italicString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: font])
        
        return italicString
    }
    
    func color(_ color: UIColor) -> NSAttributedString {
        let colorString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.foregroundColor: color])
        return colorString
    }
    
    func colorSubString(_ subString: String, color: UIColor) -> NSMutableAttributedString {
        var start = 0
        var ranges: [NSRange] = []
        while true {
            let range = (self as NSString).range(of: subString, options: NSString.CompareOptions.literal, range: NSRange(location: start, length: (self as NSString).length - start))
            if range.location == NSNotFound {
                break
            } else {
                ranges.append(range)
                start = range.location + range.length
            }
        }
        let attrText = NSMutableAttributedString(string: self)
        for range in ranges {
            attrText.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
        
        return attrText
    }
    
    func isValidPassword() -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,16}$"
        
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
    
    func onlyNumbers() -> [NSNumber] {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let charset = CharacterSet.init(charactersIn: " ,")
        return matches(for: "[+-]?([0-9]+([., ][0-9]*)*|[.][0-9]+)").compactMap { string in
            return formatter.number(from: string.trimmingCharacters(in: charset))
        }
    }
    
    func matches(for regex: String) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: regex, options: [.caseInsensitive]) else { return [] }
        let matches  = regex.matches(in: self, options: [], range: NSMakeRange(0, self.count))
        return matches.compactMap { match in
            guard let range = Range(match.range, in: self) else { return nil }
            return String(self[range])
        }
    }
}

public extension Collection {
    var pairs: [SubSequence] {
        var start = startIndex
        return (0...count/2).map { _ in
            let end = index(start, offsetBy: 2, limitedBy: endIndex) ?? endIndex
            defer { start = end }
            return self[start..<end]
        }
    }
}

public extension StringProtocol where Self: RangeReplaceableCollection {
    mutating func insert(separator: String, every n: Int) {
        indices.reversed().forEach {
            if $0 != startIndex { if distance(from: startIndex, to: $0) % n == 0 { insert(contentsOf: separator, at: $0) } }
        }
    }
    
    func inserting(separator: String, every n: Int) -> Self {
        var string = self
        string.insert(separator: separator, every: n)
        return string
    }
}
