//
//  ProductDetailView.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 26.06.2023.
//

import UIKit
import SnapKit

protocol ProductDetailViewInputProtocol: AnyObject {
    func updateProduct(_ product: Product?)
    func updatePriceButton(_ product: Product)
}

protocol ProductDetailViewOutputProtocol {
    func addToCart()
}

final class ProductDetailVC: UIViewController, ScreenRoutable {
    
    var presenter: ProductDetailViewOutputProtocol?
    var rootView: ProductDetailView
    
    //MARK: - LifeCycle
    init(rootView: ProductDetailView, presenter: ProductDetailViewOutputProtocol) {
        self.rootView = rootView
        self.presenter = presenter
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        rootView.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        rootView.orderButton.layer.cornerRadius = 27
    }
}

extension ProductDetailVC: ProductDetailViewDelegateProtocol {
    //MARK: - Actions
    func addOrder() {
        presenter?.addToCart()
        dismissView(animated: true, completion: nil)
    }
    
    func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - DetailProductViewInputProtocol
extension ProductDetailVC: ProductDetailViewInputProtocol {
    func updatePriceButton(_ product: Product) {
        rootView.orderButton.setTitle("В корзину за \(product.price) ₸", for: .normal)
    }
    
    func updateProduct(_ product: Product?) {
        rootView.tableAdapter.product = product
    }
}

