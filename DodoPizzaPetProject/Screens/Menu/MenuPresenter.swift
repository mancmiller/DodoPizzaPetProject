//
//  .swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 26.06.2023.
//

import Foundation

final class MenuPresenter: MenuViewOutputProtocol {
    
    weak var view: MenuViewInputProtocol?
    var router: MenuRouterInputProtocol?
    var interactor: MenuInteractorInputProtocol?

    var products: [Product] = []
    
    init(interactor: MenuInteractorInputProtocol, router: MenuRouterInputProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func fetchCategories() {
        var category: Set<String> = []
        for product in products {
            category.insert(product.category)
        }
        let sortedCategories = [String](category).sorted(by: >)
        
        view?.updateCategories(sortedCategories)
    }
    
    func fetchProducts() {
        interactor?.fetchProducts()
    }
    
    func itemSelected(index: Int) {
        let product = products[index]
        router?.showProductDetail(product: product)
    }
}

extension MenuPresenter: MenuInteractorOutputProtocol {
    func fetchedProducts(_ data: ProductsResponse) {
        DispatchQueue.main.async { [ weak self ] in
            
            let productItems = data.items.sorted(by: {first, second in
                return first.category > second.category
            })
            
            self?.products = productItems
            self?.view?.updateProducts(productItems)
            self?.view?.updateBanners(data.banners)
        }
    }
}
