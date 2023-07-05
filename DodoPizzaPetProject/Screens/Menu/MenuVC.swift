//
//  MenuVC.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 26.06.2023.
//

import UIKit

protocol MenuViewInputProtocol: AnyObject {
    func updateBanners(_ banners: [String])
    func updateProducts(_ products: [Product])
    func updateCategories(_ categories: [String])
}

protocol MenuViewOutputProtocol {
    func fetchProducts()
    func fetchCategories()
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
        rootView.delegate = self
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

// MARK: - UIPopoverPresentationControllerDelegate
extension MenuVC: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

// MARK: - CityPopOverViewOutputProtocol
extension MenuVC: CityPopOverViewOutputProtocol {
    func selectedCity(_ string: String) {
        rootView.cityLabel.text = string
    }
}

//MARK: - CategoriesViewDelegate
extension MenuVC: CategoriesViewDelegate {
    func scrollToRow(with category: String) {
        guard let index = presenter.products.firstIndex(where: { $0.category == category }) else { return }
        rootView.tableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .top, animated: true)
    }
}

// MARK: - MenuViewInputProtocol
extension MenuVC: MenuViewInputProtocol {
    func updateProducts(_ products: [Product]) {
        rootView.tableView.allowsSelection = true
        rootView.tableAdapter.items = products
        presenter.fetchCategories()
        rootView.tableView.reloadData()
    }
    
    func updateBanners(_ banners: [String]) {
        rootView.bannersHeaderView.update(bannersString: banners)
        rootView.tableView.reloadData()
    }
    
    func updateCategories(_ categories: [String]) {
        rootView.tableAdapter.categories = categories
        rootView.tableView.reloadData()
    }
}

// MARK: - MenuViewDelegateProtocol

extension MenuVC: MenuViewDelegateProtocol {
    func menuViewCityButtonTapped(imageView: UIImageView) {
        let cityPopOverVC = CityPopOverViewController()
        cityPopOverVC.modalPresentationStyle = .popover
        cityPopOverVC.preferredContentSize = CGSize(width: 190, height: 220)
        cityPopOverVC.delegate = self
        
        guard let presentationVC = cityPopOverVC.popoverPresentationController else { return }
        presentationVC.delegate = self
        presentationVC.sourceView = imageView
        presentationVC.permittedArrowDirections = .up
        presentationVC.sourceRect =  CGRect(x: imageView.bounds.midX,
                                            y: imageView.bounds.midY, width: 0, height: 0)
        present(cityPopOverVC, animated: true)
    }
}
