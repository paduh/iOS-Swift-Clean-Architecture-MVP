//
//  Assembly+PaymenMethods.swift
//  Payoneer
//
//  Created by Aduh Perfect on 06/06/2021.
//

import UIKit

// MARK:- Payment methods assembly

extension ViewControllerAssembly {
    
    static var paymentMethodsController: UIViewController {
        let view = PaymentMethodsController()
        let paymentMethodService = PaymentMethodsService()
        let presenter = PaymentMethodPresenter(paymentMethodService: paymentMethodService)
        view.presenter = presenter
        view.title = "Payment Methods"
        return view
    }
}
