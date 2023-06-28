//
//  MenuTableAdapter.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 27.06.2023.
//

import UIKit

protocol MenuTableAdapterOutputProtocol: AnyObject {
    func itemSelected(index: Int)
}

class MenuTableAdapter: NSObject {
    var items: [Product] = []
    weak var controller: MenuTableAdapterOutputProtocol?
}

extension MenuTableAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        controller?.itemSelected(index: indexPath.row)
    }
}

extension MenuTableAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseID) as? ProductCell else { return UITableViewCell() }
        
        let product = items[indexPath.row]
        cell.configure(model: product)
        cell.selectionStyle = .none
        return cell
    }
}
