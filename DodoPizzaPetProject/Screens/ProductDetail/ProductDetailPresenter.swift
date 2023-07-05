//
//  ProductDetailPresenter.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 26.06.2023.
//

protocol ProductDetailPresenterInputProtocol: AnyObject {
    func configureModule(with product: Product)
}

protocol ProductDetailPresenterOutputProtocol {}

final class ProductDetailPresenter: ProductDetailViewOutputProtocol {
    
    weak var view: ProductDetailViewInputProtocol?
    var router: ProductDetailRouterInputProtocol?
    var interactor: ProductDetailInteractorInputProtocol?
    
    var product: Product?
    
    init(router: ProductDetailRouterInputProtocol, interactor: ProductDetailInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func addToCart() {
        
    }
}

extension ProductDetailPresenter: ProductDetailInteractorOutputProtocol {}

extension ProductDetailPresenter: ProductDetailPresenterInputProtocol {
    func configureModule(with product: Product) {
        self.product = product
        view?.updateProduct(product)
        view?.updatePriceButton(product)
    }
}
