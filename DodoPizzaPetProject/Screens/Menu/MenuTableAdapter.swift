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

final class MenuTableAdapter: NSObject {
    var items: [Product] = []
    var categories: [String] = []
    
    weak var view: CategoriesViewDelegate?
    weak var controller: MenuTableAdapterOutputProtocol?
}

// MARK: - Header height
extension MenuTableAdapter {
    private struct Layout {
        static let categoryHeight: CGFloat = 50
    }
}

//MARK: - UITableViewDelegate
extension MenuTableAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        controller?.itemSelected(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Layout.categoryHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let categoriesView = CategoriesView(categories: categories)
        categoriesView.delegate = view
        return categoriesView
    }
    
    
}

//MARK: - UITableViewDataSource
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
