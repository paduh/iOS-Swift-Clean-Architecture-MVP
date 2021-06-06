//
//  PaymentMethodsController.swift
//  Payoneer
//
//  Created by Aduh Perfect on 06/06/2021.
//

import UIKit

typealias GenericTableDataSourceDelegate = UITableViewDataSource & UITableViewDelegate

class PaymentMethodsController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(PaymentMethodsCell.self)
        }
    }
    
    // MARK: Properties
    var dataSourceDelegate: GenericTableDataSourceDelegate!
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
        tableView.delegate = dataSourceDelegate
        tableView.dataSource = dataSourceDelegate
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
        self.dataSourceDelegate = handleTableViewDataSource(model: applicable)
        tableView.dataSource = dataSourceDelegate
    }
    
    func setErrorMessage(msg: String) {
        
    }
    
    func setEmptyState() {
        
    }
}

// MARK:- Helpers

extension PaymentMethodsController {
    func handleTableViewDataSource(model: [Applicable]) -> GenericTableDataSourceDelegate {
        return TableViewDataSource<Applicable, PaymentMethodsCell>(
            models: applicable) { (payment, cell) in
            let item = PaymentMethodsItem(payment: payment)
            cell.configureCell(item: item)
        }
    }
}
