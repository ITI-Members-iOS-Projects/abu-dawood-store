//
//  BaseRequstBuilder.swift
//  Abu Dawood
//
//  Created by MESHO on 29/05/2024.
//

import Alamofire
import Foundation
import UIKit

protocol BaseRequstBuilder: URLRequestConvertible, BaseRequestHandler, BaseMultiRequestHandler {
    // Path
    var mainPath: String { get }
    //
    var urlPath: String { get }
    // Paramter
    var paramter: [String: Any]? { get }
    // Headers
    var headers: HTTPHeaders { get }
    // Http Method
    var hettpMethod: HTTPMethod { get }
    //
    var urlRequest: URLRequest { get }
    //
    var encoding: ParameterEncoding { get }
    //
    var paramterData: Data? { get }
    
    var queryParams: [URLQueryItem] { get }
}

extension BaseRequstBuilder {
    var queryParams: [URLQueryItem] {
        return []
    }
   
     var language: String {
//        return MOLHLanguage.currentAppleLanguage().rawValue
        return "en"
    }
    // ---------Path---------
     var mainPath: String {
        return Environment.baseURL + "api/"
    }
    // Paramter
     var paramter: [String: Any]? {
        return nil
    }
    // Header
     var headers: HTTPHeaders {
         return [
            .authorization(bearerToken: KeychainSwift().get(.token) ?? ""),
            HTTPHeader.init(name: "Accept", value: "application/json")
         ]
    }
    
    var paramterData: Data? {
        return nil
    }

    //=================================================
     var encoding: ParameterEncoding {
        switch hettpMethod {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }

    var urlRequest: URLRequest {
        let _urlPath = (mainPath + urlPath)

        guard var urlComps = URLComponents(string: _urlPath)  else {
            fatalError("Invalid url ............")
        }
        urlComps.queryItems = queryParams
        var request = URLRequest(url: urlComps.url!)
        request.httpMethod = hettpMethod.rawValue
        print(urlComps.url ?? URL(fileURLWithPath: ""))
        request.headers = headers
        return request
    }

    // MARK: - URLRequestConvertible

     func asURLRequest() throws -> URLRequest {
         if let data = paramterData, let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
             return try encoding.encode(urlRequest, with: json)
         }
        return try encoding.encode(urlRequest, with: paramter)
        
    }
    //=================================================
}
