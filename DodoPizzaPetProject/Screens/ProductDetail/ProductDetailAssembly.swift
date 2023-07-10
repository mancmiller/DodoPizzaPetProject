//
//  ProductDetailAssembly.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 26.06.2023.
//

final class ProductDetailAssembly {
    func configure(with product: Product) -> ProductDetailVC {
        
        let router = ProductDetailRouter()
        let tableAdapter = ProductDetailTableAdapter()
        
        let view = ProductDetailView(tableAdapter: tableAdapter)
        let interactor = ProductDetailInteractor()
        let presenter = ProductDetailPresenter(router: router, interactor: interactor)
        let controller = ProductDetailVC(rootView: view, presenter: presenter)
        
        presenter.view = controller
        presenter.configureModule(with: product)
        interactor.presenter = presenter
        router.view = controller
        
        return controller
    }
}
