//
//  MenuRouter.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 26.06.2023.
//

import UIKit

protocol MenuRouterInputProtocol {
    func showProductDetail(product: Product)
}

protocol MenuRouterOutputProtocol {}

final class MenuRouter: MenuRouterInputProtocol {
    weak var view: ScreenRoutable?
    
    func showProductDetail(product: Product) {
        let vc = ProductDetailAssembly().configure(with: product)
        view?.presentScreen(vc, animated: true, completion: nil)
    }
}
