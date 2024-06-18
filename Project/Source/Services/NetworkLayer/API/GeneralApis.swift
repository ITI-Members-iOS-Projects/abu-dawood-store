//
//  GeneralApis.swift
//  Abu Dawood
//
//  Created by MESHO on 29/05/2024.
//

import Foundation
import Alamofire
import UIKit

// swiftlint:disable all
enum StationaryApis: BaseRequstBuilder {
    
    case homeApi
    case login(Data)
    case register(ParameterData)
    case sendCode(ParameterData)
    case confirmCode(ParameterData)
    case sendForgetCode(ParameterData)
    case makeNewPAssword(ParameterData)
    case sections
    case products([URLQueryItem])
    case singleProduct(Int)
    case allComments(Int, [URLQueryItem])
    case addComment(ParameterData)
    case productReviews(Int, [URLQueryItem])
    case deliveryMethods
    case getAddresses
    case checkCoupon(ParameterData)
    case shop(ParameterData)
    case checkout(ParameterData)
    case makeUserAddress(ParameterData)
    case singleService(Int)
    case allServices([URLQueryItem])
    
    var urlPath: String {
        switch self {
        case .homeApi: return "home"
        case .login: return "login"
        case .register: return "register"
        case .sendCode: return "send-code"
        case .confirmCode: return "confirm-code"
        case .sendForgetCode: return "forget-password"
        case .makeNewPAssword: return "reset-password"
        case .sections: return "categories"
        case let .singleProduct(id): return "products/\(id)"
        case .addComment: return "add-comment"
        case .products: return "products"
        case let .allComments(id, _): return "product-comments/\(id)"
        case let .productReviews(id, _): return "product-reviews/\(id)"
        case .deliveryMethods: return "delivery_methods"
        case .getAddresses: return "addresses"
        case .checkCoupon: return "check-coupon"
        case .shop: return "orders/shop"
        case .checkout: return "checkout"
        case .makeUserAddress: return "addresses"
        case let .singleService(id): return "service/\(id)"
        case .allServices: return "services"
        }
    }
    //
    var queryParams: [URLQueryItem] {
        switch self {
        case .products(let query),
                .allComments(_, let query),
                .productReviews(_, let query),
                .allServices(let query):
            return query
        default:
            return []
        }
    }
    
    var paramter: [String : Any]? {
        switch self {
        case .register(let data),
                .sendCode(let data),
                .confirmCode(let data),
                .sendForgetCode(let data),
                .makeNewPAssword(let data),
                .addComment(let data),
                .checkCoupon(let data),
                .shop(let data),
                .checkout(let data),
                .makeUserAddress(let data):
            return data
        default:
            return nil
        }
    }
    
    var paramterData: Data? {
        switch self {
        case .login(let data):
            return data
        default:
            return nil
        }
    }
    //
    var hettpMethod: HTTPMethod {
        switch self {
        case .login, .register, .sendCode, .confirmCode, .sendForgetCode, .makeNewPAssword, .addComment, .checkCoupon, .shop, .checkout, .makeUserAddress: return .post
        default: return .get
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .register:
            return [
                .contentType("multipart/form-data"),
                .accept("application/json"),
                .init(name: "locale", value: LocalizationManager.shared.getLanguage()?.code ?? "en")
                
            ]
        default:
            return [
                .authorization(bearerToken: KeychainSwift().get(.token) ?? ""),
                HTTPHeader.init(name: "Accept", value: "application/json"),
                .init(name: "locale", value: LocalizationManager.shared.getLanguage()?.code ?? "en")
            ]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .homeApi, .register:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var multipartParmter: ((MultipartFormData) -> Void) {
        switch self {
        case let .register(multiPartParams):
            return { multiPartForm in
                for (key,value) in multiPartParams {
                    if let image_ = value as? UIImage {
                        if let img_data = image_.jpegData(compressionQuality: 0.2) {
                            multiPartForm.append(img_data, withName: key, fileName: "\(key).jpeg", mimeType: "image/jpeg")
                        }
                    } else {
                        multiPartForm.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                    }
                }
            }
        default:
            return { _ in }
        }
    }

}

typealias ParameterData = [String: Any]
// swiftlint:disable all
