//
//  HTTPURLResponse+Extension.swift
//  Payoneer
//
//  Created by Aduh Perfect on 05/06/2021.
//

import Foundation

// MARK:- HTTPURLResponse Extension

extension HTTPURLResponse {
    
    func handleNetworkResponse() -> Result<String>{
        switch self.statusCode {
        case 200...299, 422, 400: return .success
        case 401: return .success
        case 403: return .failure("Your email address is not verified. Please verify your email")
        case 402...499: return .failure(NetworkResponse.authenticationError.rawValue)
        case 500...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        case 1001: return .failure(NetworkResponse.noNetworkConnection.rawValue)
        case 999: return .failure(NetworkResponse.noNetworkConnection.rawValue)
       // case 400: return .failure("Well this is embarrassing... The service is unavailable at the moment. Please try again later.")
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
