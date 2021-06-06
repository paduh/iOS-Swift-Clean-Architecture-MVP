//
//  PaymentMethodsService.swift
//  Payoneer
//
//  Created by Aduh Perfect on 05/06/2021.
//

import Foundation

// MARK:- Payment Methods Completion

typealias PaymentMethodsCompletion = ((Result<Payments?>)->())

// MARK:- Payment Methods ServiceDelegate

protocol PaymentMethodsServiceDelegate {
    func paymentMethods(completion: @escaping PaymentMethodsCompletion)
}

// MARK:- Payment Methods Service

class PaymentMethodsService {
    
    // MARK: Properties
    
    var router: Router<PaymentMethodsEndPoint, Payments>!
    
    // MARK: Initializer / DeInitializer
    
        init(router: Router<PaymentMethodsEndPoint, Payments> = Router<PaymentMethodsEndPoint, Payments>()) {
        self.router = router
    }
}

// MARK:- Payment Methods Service & Payment Methods Service Delegate

extension PaymentMethodsService: PaymentMethodsServiceDelegate {
    func paymentMethods(completion: @escaping PaymentMethodsCompletion) {
        router.request(route: .paymentMethods, logContent: true, completion: completion)
    }
}
