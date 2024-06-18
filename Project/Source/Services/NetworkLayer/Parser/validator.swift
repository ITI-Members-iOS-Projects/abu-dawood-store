//
//  validator.swift
//  Abu Dawood
//
//  Created by MESHO on 29/05/2024.
//

import Foundation

class StaticApiResponseValidator {
   static var shared = StaticApiResponseValidator()
    func validateDefaultResponse<T:Codable>(with apiData: StaticApiResponse<T>) throws -> T {
       guard let data = apiData.data, let status = apiData.status, status else {
           let message = apiData.message
           throw ResultError.messageError(message)
       }
       return data
   }
}

class StaticApiResponse<T:Codable>: Codable {
    let status: Bool?
    let code: Int?
    let message: String?
    let data: T?
    let token: String?
   
    func validateDataResponse<T: Codable>() throws -> T { 
       guard let success = status , success ,let data = data as? T else {
           throw ResultError.messageError(message)
       }
       return data
   }
   //
    func isValidDecodable() throws {
       guard let success = status , success else {
           throw ResultError.messageError(message)
       }
   }
   
}
