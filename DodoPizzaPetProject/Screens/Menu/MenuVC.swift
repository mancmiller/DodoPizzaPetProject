//
//  MenuVC.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 26.06.2023.
//

import UIKit

protocol MenuViewInputProtocol {
    func updateProducts(_ products: [Product])
}

protocol MenuViewOutputProtocol {
    func fetchProducts()
    func itemSelected(index: Int)
    var products: [Product] { get set }
}

final class MenuVC: UIViewController, ScreenRoutable {
    
    var presenter: MenuViewOutputProtocol
    var rootView: MenuView
    
// MARK: - Life Cycle
    init(presenter: MenuViewOutputProtocol, rootView: MenuView) {
        self.presenter = presenter
        self.rootView = rootView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchProducts()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

// MARK: - MenuTableAdapterOutputProtocol
extension MenuVC: MenuTableAdapterOutputProtocol {
    func itemSelected(index: Int) {
        presenter.itemSelected(index: index)
    }
}

// MARK: - MenuViewInputProtocol
extension MenuVC: MenuViewInputProtocol {
    func updateProducts(_ products: [Product]) {
        rootView.tableView.allowsSelection = true
        rootView.tableAdapter.items = products
        presenter.fetchProducts()
        rootView.tableView.reloadData()
    }
}
