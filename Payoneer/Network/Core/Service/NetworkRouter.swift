//
//  NetworkRouter.swift
//  Payoneer
//
//  Created by Aduh Perfect on 05/06/2021.
//

import Foundation


protocol NetworkRouter {
    
    associatedtype EndPoint: EndPointType
    associatedtype T: Codable
    
    typealias NetworkRouterCompletion = ((_ data: T?,_ error: String?)->())
    
    func request(route: EndPoint, logContent: Bool, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
