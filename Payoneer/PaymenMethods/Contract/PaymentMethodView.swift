//
//  PaymentMethodView.swift
//  Payoneer
//
//  Created by Aduh Perfect on 06/06/2021.
//

import Foundation

// MARK: - PaymentMethodView

protocol PaymentMethodView: class {
    func showLoading()
    func hideLoading()
    func loadPaymentMethod(paymentMethods: Payments)
    func setErrorMessage(msg: String)
    func setEmptyState()
}
