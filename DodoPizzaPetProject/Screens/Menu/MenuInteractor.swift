//
//  MenuInteractor.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 26.06.2023.
//

protocol MenuInteractorInputProtocol {
    func fetchProducts()
}

protocol MenuInteractorOutputProtocol: AnyObject {
    func fetchedProducts(_ data: ProductsResponse)
}

final class MenuInteractor: MenuInteractorInputProtocol {
    
    weak var presenter: MenuInteractorOutputProtocol?
    
    var productsAPI: ProductsAPIInputProtocol?
    
    required init(apiService: ProductsAPIInputProtocol) {
        self.productsAPI = apiService
    }
    
// MARK: - Network Request
    func fetchProducts() {
        Task {
            do {
                guard let response = try await productsAPI?.fetchCollection() else { return }
                presenter?.fetchedProducts(response)
            } catch {
                print(error)
            }
        }
    }
}
