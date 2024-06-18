//
//  String+Extension.swift
//
//  Created by Mohamed gamal on 20/12/2022.
//

import Foundation
import UIKit

public enum DateFormate: String {
    case yearMonthDay = "yyyy-MM-dd HH:mm:ss"
    case yearMonthMinutes = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    case dayMonthYear = "d MMM yyyy"
    case dayMonth = "d MMM"
    case hourMinute = "HH:mm"
}

public extension String {

    /// A Boolean value indicating whether a string has no characters after removing all whitespaces and all newlines.
    var hasValue: Bool {
        let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return !trimmed.isEmpty
    }

    func toDate(format: DateFormate) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = format.rawValue
        let date = dateFormatter.date(from: self)
        return date
    }

    func removeWhiteSpaces() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }

    func extractAndConvertToInt() -> Int? {
        // Create a regular expression pattern to match digits
        let regexPattern = #"(\d+)"#
        
        // Create a regular expression object
        if let regex = try? NSRegularExpression(pattern: regexPattern, options: []) {
            // Find the first match in the string
            if let match = regex.firstMatch(in: self, options: [], range: NSRange(self.startIndex..., in: self)) {
                // Extract the matched digits
                if let range = Range(match.range, in: self) {
                    // Convert the extracted substring to an integer
                    if let intValue = Int(self[range]) {
                        return intValue
                    }
                }
            }
        }
        
        // If no digits were found or conversion fails, return nil
        return nil
    }
}

public extension String {
    /// A Boolean value indicating whether the string represents a valid Youtube URL.
    var isValidYoutubeLink: Bool {
        let youtubeRegex = "(http(s)?:\\/\\/)?(www\\.|m\\.)?youtu(be\\.com|\\.be)(\\/watch\\?([&=a-z]{0,})(v=[\\d\\w]{1,}).+|\\/[\\d\\w]{1,})"
        let youtubeCheckResult = NSPredicate(format: "SELF MATCHES %@", youtubeRegex)
        
        return youtubeCheckResult.evaluate(with: self)
    }
}

public extension String {
    /// A Boolean value indicating whether the string represents a valid URL.
    var isValidURL: Bool {
        guard let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        else { return false }
        
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: .zero, length: self.utf16.count)) {
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
}

public extension String {
    /// A String value representing the Youtube video ID.
    func extractVideoID() -> String? {
        guard isValidYoutubeLink, let url = URL(string: self)
        else { return .none }
        
        let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems
        
        return queryItems?.first(where: { $0.name == "v" })?.value
    }
}
