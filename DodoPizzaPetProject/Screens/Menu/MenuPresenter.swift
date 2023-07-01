//
//  .swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 26.06.2023.
//

import Foundation

final class MenuPresenter: MenuViewOutputProtocol {
    
    weak var view: MenuViewInputProtocol?
    
    var interactor: MenuInteractorInputProtocol?

    var products: [Product] = []
    
    init(interactor: MenuInteractorInputProtocol) {
        self.interactor = interactor
    }
    
    func fetchProducts() {
        interactor?.fetchProducts()
    }
    
    func itemSelected(index: Int) {
        // show product detail 
    }
}

extension MenuPresenter: MenuInteractorOutputProtocol {
    func fetchedProducts(_ data: ProductsResponse) {
        DispatchQueue.main.async { [ weak self ] in
            let productItems = data.items
            self?.products = productItems
            self?.view?.updateProducts(productItems)
        }
    }
}
