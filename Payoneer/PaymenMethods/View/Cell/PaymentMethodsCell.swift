//
//  PaymentMethodsCell.swift
//  Payoneer
//
//  Created by Aduh Perfect on 06/06/2021.
//

import UIKit

protocol CellPresentable {
    
    func configureCell(item: PaymentMethodsItem)
}

final class PaymentMethodsCell: UITableViewCell {
    
    //MARK: IBOUtlets
    
    @IBOutlet weak private var paymentNameLabel: UILabel!
    @IBOutlet weak private var paymentImageView: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}


extension PaymentMethodsCell: CellPresentable {
    func configureCell(item: PaymentMethodsItem) {
        paymentNameLabel.text = item.name
        paymentImageView.loadImageUsingCache(withUrl: item.imageUrl)
    }
}


class PaymentMethodsItem {
    
    let name: String
    let imageUrl: String
    
    init(payment: Applicable) {
        name = payment.label ?? ""
        imageUrl = payment.links?.logo ?? ""
    }
}
