//
//  MenuAssembly.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 26.06.2023.
//

final class MenuAssembly {
    func configure() -> MenuVC {
        
        let tableAdapter = MenuTableAdapter()
        let productsAPI = ProductsAPI()
//        let router = MenuRouter()
        
        let view = MenuView(tableAdapter: tableAdapter)
        let interactor = MenuInteractor(apiService: productsAPI)
        let presenter = MenuPresenter(interactor: interactor)
        let controller = MenuVC(presenter: presenter, rootView: view)
        
        tableAdapter.controller = controller
        tableAdapter.view = controller
        presenter.view = controller
        interactor.presenter = presenter
        
        return controller
    }
}
