//
//  RequstParsing.swift
//  Abu Dawood
//
//  Created by MESHO on 29/05/2024.
//

import Alamofire
import UIKit

 protocol BaseResponseHandler {
    func handleResponse<T>(_ response: AFDataResponse<Data>) throws -> T where T: Codable
}

 class RequstParsing: NSObject {}

extension RequstParsing: BaseResponseHandler {
    
     func handleResponse<T>(_ response: AFDataResponse<Data>) throws -> T where T: Codable {
        // If error Found------------
        guard let urlResponse = response.response else {
            if let error = response.error as NSError?, error.code == NSURLErrorNotConnectedToInternet {
                throw ResultError.noInternt
            } else {
               throw ResultError.failure(.error(response.error?.localizedDescription))
            }
        }

        let status = ResponseStatusCode(urlResponse.statusCode, error: response.error?.localizedDescription, response: response.data)

        switch status {
        case .success:

            if let json = response.data {
                do {
                    let modules = try JSONDecoder().decode(T.self, from: json)
                    return modules
                } catch {
                    throw ResultError.cannotDecodeData(error)
                }
            } else {
                throw ResultError.cannotDecodeData(AppLocalizedKeys.reponseDataNullKey)
            }

        case let .failure(error):
            throw error
        }
    }
}
