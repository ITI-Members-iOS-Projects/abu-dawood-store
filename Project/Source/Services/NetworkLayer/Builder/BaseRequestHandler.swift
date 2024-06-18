//
//  BaseRequestHandler.swift
//  Abu Dawood
//
//  Created by MESHO on 29/05/2024.
//

import Alamofire
import Foundation

 protocol BaseRequestHandler {
    func sendRequst<T: Codable>(data: T.Type) async throws -> StaticApiResponse<T>
}

extension BaseRequestHandler where Self: URLRequestConvertible {
     func sendRequst<T: Codable>(data _: T.Type) async throws -> StaticApiResponse<T> {
        return try await withCheckedThrowingContinuation { continuation  in
            AF.request(self).validate().responseDecodable { response_ in
                //=======================================================
                do {
                    let parse:StaticApiResponse<T> = try RequstParsing().handleResponse(response_)
                    guard let success = parse.status, success else {
                        continuation.resume(throwing: parse.message ?? NoMessageError.noMessageError)
                        return
                    }
                    continuation.resume(returning: parse)
                } catch {
                    continuation.resume(throwing: error)
                }
                //========================================================
            }
        }
        
    }
}

enum NoMessageError: Error {
    case noMessageError
}
