//
//  UiViewController+Extension.swift
//  Payoneer
//
//  Created by Aduh Perfect on 06/06/2021.
//

import UIKit

extension UIViewController {
        func showAlert(msg: String) {
            let alert = UIAlertController(title: Text.payoneer.rawValue, message: msg, preferredStyle: .alert)
            let okAction = UIAlertAction(title: Text.ok.rawValue, style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        if self.children.count > 0 {
            let viewControllers:[UIViewController] = self.children
               for viewContoller in viewControllers {
                viewContoller.willMove(toParent: nil)
                viewContoller.view.removeFromSuperview()
                viewContoller.removeFromParent()
               }
           }
    }
}
