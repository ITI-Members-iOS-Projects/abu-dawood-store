//
//  ResultError.swift
//  Abu Dawood
//
//  Created by MESHO on 29/05/2024.
//

import Foundation

public enum ResponseStatusCode {
    public init(_ statusCode: Int, error: String?, response: Data?) {
        switch statusCode {
        case 200..<300:
            
            self = ResponseStatusCode.success
            
        case 400 ... 499:
            
            guard let jsonObject = try? JSONSerialization.jsonObject(with: response ?? Data(), options: []) as? [String: Any] else { self = ResponseStatusCode.failure(ResultError(statusCode, error: error))
                return
            }
            if let message = jsonObject["message"] as? String {
                self = ResponseStatusCode.failure(ResultError.messageError(message))
            } else {
                self = ResponseStatusCode.failure(ResultError(statusCode, error: error))
            }
            
        default: self = ResponseStatusCode.failure(ResultError(statusCode, error: error))
        }
    }
    
    case success
    case failure(ResultError)
}

public enum ResultError:Error {
    case cannotDecodeData(Error)
    case noInternt
    case messageError(String?)
    case failure(ErrorCodes)
    
    public init(_ statusCode: Int, error: String?) {
        switch statusCode {
            
        case NSURLErrorNetworkConnectionLost, NSURLErrorNotConnectedToInternet:
            self = .noInternt
        default:
            self = .failure(ErrorCodes(statusCode, error: error))
            
        }
    }
    
    public var describtionError: String {
        switch self {
        case let .failure(error):
            return error.error
        case .noInternt:
            return NSLocalizedString("No Internet connection.Make sure that Wi-Fi or mobile data is turned on that try again", comment: "")
        case let .messageError(error):
            return error ?? ""
        case .cannotDecodeData(let error):
            if let error = error as? DecodingError {
                switch error {
                case .typeMismatch(_, let context):
                    return "\(context.debugDescription) in some Keys"
                default:
                    return error.localizedDescription
                }
            }
            return error.localizedDescription
        }
    }
}

public enum ErrorCodes {
    init(_ errorCode: Int, error: String?) {
        switch errorCode {
        case NSURLErrorBadURL, NSURLErrorUnsupportedURL, NSURLErrorCannotFindHost: self = .badUrl
        case 401: self = .tokenExpire
        case 403: self = .forbiden
        case 412: self = .validateInputs
        case 500: self = .internalServerError
        default: self = .error(error)
        }
    }
    
    case error(String?) // Error.Description
    case badUrl // 400
    case tokenExpire // 401
    case validateInputs // 412
    case forbiden // 403
    case internalServerError // 500
    case badServerResponse
    
    public var error: String {
        switch self {
        case let .error(errorDescription):
            return errorDescription ?? ""
            
        case .badUrl:
            return "Bad url , you cannot access method"
            
        default:
            return "Server Error"
        }
    }
}

extension AppLocalizedKeys: Error {
    
}

extension String: Error {
    
}
