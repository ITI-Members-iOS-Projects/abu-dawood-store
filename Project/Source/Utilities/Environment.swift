//
//  Environment.swift
//  Abu Dawood
//
//  Created by MESHO on 29/05/2024.
//

import Foundation
/// A utility for accessing environment-specific configuration from the app's Info.plist.
enum Environment {
    private enum PlistKeys {
        static let baseURL = "SERVER_URL"

    }
    /// Retrieve information from the app's Info.plist file.
    private static var infoDictionary: [String: Any] {
        guard let dict = Bundle.main.infoDictionary else {
            preconditionFailure("Plist file not found")
        }
        return dict
    }
    /// The base URL for the server.
    static var baseURL: String {
        guard let rootURLString = Environment.infoDictionary[PlistKeys.baseURL] as? String else {
            preconditionFailure("Root URL not set in plist for this environment")
        }
        return rootURLString
    }
    
}
