//
//  PaymentMethodsEndPoint.swift
//  Payoneer
//
//  Created by Aduh Perfect on 05/06/2021.
//

import Foundation

// MARK:- PaymentMethodsEndPoint

enum PaymentMethodsEndPoint {
    
    case paymentMethods
}

extension PaymentMethodsEndPoint: EndPointType {
    var baseUrl: URL {
        return URL(string: "")!
    }
    
    var path: String {
        switch self {
        case .paymentMethods:
            return ""
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .paymentMethods:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .paymentMethods:
            return .requestParameters(bodyParameters: nil, bodyEncoding: .jsonEncoding, urlParameters: nil)
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .paymentMethods:
            return nil
        }
    }
}
