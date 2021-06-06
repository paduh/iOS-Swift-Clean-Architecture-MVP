//
//  PaymentMethodPresenter.swift
//  Payoneer
//
//  Created by Aduh Perfect on 06/06/2021.
//

import Foundation

// MARK: - PaymentMethodPresenter

class PaymentMethodPresenter {
    
    // MARK: - Properties
    
    private let paymentMethodService: PaymentMethodsService!
    weak var paymentMethodsView: PaymentMethodView?
    
    // MARK: - Initializer / DeInitializer
    
    init(paymentMethodService: PaymentMethodsService) {
        self.paymentMethodService = paymentMethodService
    }
    
    func attachView(view: PaymentMethodView) {
        paymentMethodsView = view
    }
    
    func detachView() {
        paymentMethodsView = nil
    }
}

// MARK: - Fetch Payment methods

extension PaymentMethodPresenter {
    func fetchPaymentMethods() {
        paymentMethodsView?.showLoading()
        paymentMethodService.paymentMethods { [weak self] (result) in
            guard let self = self else { return }
            self.paymentMethodsView?.hideLoading()
            switch result {
            case .failure(let error):
                self.paymentMethodsView?.setErrorMessage(msg: error.title)
            case .success(let paymentMethods):
                guard let paymentMethods = paymentMethods else {
                    self.paymentMethodsView?.setEmptyState()
                    return
                }
                self.paymentMethodsView?.loadPaymentMethod(paymentMethods: paymentMethods)
            }
        }
    }
}
