//
//  ProductDetailInteractor.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 26.06.2023.
//

protocol ProductDetailInteractorInputProtocol {
    func addProductToCart(_ product: Product)
}

protocol ProductDetailInteractorOutputProtocol: AnyObject {}

final class ProductDetailInteractor: ProductDetailInteractorInputProtocol {
    func addProductToCart(_ product: Product) {
        
    }
    
    weak var presenter: ProductDetailInteractorOutputProtocol?
    
}
