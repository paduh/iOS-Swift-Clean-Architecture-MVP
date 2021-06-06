//
//  TableViewDataSource.swift
//  Payoneer
//
//  Created by Aduh Perfect on 06/06/2021.
//

import UIKit

// MARK:- Generic TableViewDataSource

class TableViewDataSource<Model, Cell: UITableViewCell>: NSObject, UITableViewDataSource {
    
    //MARK:- Properties
    
    typealias CellConfigurator = ((Model, Cell) -> Void)
    var models: [Model]
    private let cellConfigurator: CellConfigurator
    
    //MARK: Initialiser
    
    init(models: [Model], cellConfigurator: @escaping CellConfigurator) {
        self.models = models
        self.cellConfigurator = cellConfigurator
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeue(Cell.self, for: indexPath)
        cellConfigurator(model, cell)
        return cell
    }
}
