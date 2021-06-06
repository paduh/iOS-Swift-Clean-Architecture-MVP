//
//  PaymentMethodsController.swift
//  Payoneer
//
//  Created by Aduh Perfect on 06/06/2021.
//

import UIKit

class PaymentMethodsController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(PaymentMethodsCell.self)
        }
    }
    
    // MARK: Properties
    var paymentMethods: Payments?
    var applicable = [Applicable]() {
        didSet {
            tableView.reloadData()
        }
    }
    var presenter: PaymentMethodPresenter!
    
    // MARK: Life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        presenter.attachView(view: self)
        presenter.viewDidLoad()
    }
    
    deinit {
        presenter.detachView()
    }
}

extension PaymentMethodsController: PaymentMethodView {
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func loadPaymentMethod(paymentMethods: Payments) {
        self.paymentMethods = paymentMethods
        applicable = paymentMethods.networks?.applicable ?? []
    }
    
    func setErrorMessage(msg: String) {
        
    }
    
    func setEmptyState() {
        
    }
}

// MARK: UITableViewDataSource & UITableViewDelegate

extension PaymentMethodsController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applicable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(PaymentMethodsCell.self, for: indexPath)
        let item = PaymentMethodsItem(payment: applicable[indexPath.row])
        cell.configureCell(item: item)
        return cell
    }
}
