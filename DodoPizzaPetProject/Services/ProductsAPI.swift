//
//  ProductsAPI.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 29.06.2023.
//

import Foundation

protocol ProductsAPIInputProtocol {
    func fetchCollection() async throws -> ProductsResponse
}

final class ProductsAPI: ProductsAPIInputProtocol {
    
    func fetchCollection() async throws -> ProductsResponse {
        do {
            let productsResponse = try await API.request(endpoint: ProductsEndpoint.fetchProducts, responseModel: ProductsResponse.self)
            return productsResponse
        } catch {
            throw error
        }
    }
}
