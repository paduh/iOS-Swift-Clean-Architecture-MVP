//
//  NetworkResponse.swift
//  Payoneer
//
//  Created by Aduh Perfect on 05/06/2021.
//

import Foundation


enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Well this is embarrassing... The service is unavailable at the moment. Please try again later."
    case outdated = "Well this is embarrassing.. The service is unavailable at the moment, we're working on a fix so please try again later."
    case failed, noData, unableToDecode = "Well this is embarrassing.. The service is unavailable at the moment. Please try again later."
    case noNetworkConnection = "Please check your internet connection and try again"
}

enum Result<String>{
    case success
    case failure(String)
}
