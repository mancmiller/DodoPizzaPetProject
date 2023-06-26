//
//  CartAssembly.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 26.06.2023.
//


final class CartAssembly {
    func configure() -> CartVC {
        let router = CartRouter()
        let view = CartView()
        let interactor = CartInteractor()
        let presenter = CartPresenter()
        let controller = CartVC()
        return controller
    }
}
