//
//  ProductResponse.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 27.06.2023.
//

// MARK: - ProductsResponse
struct ProductsResponse: Codable {
    let items: [Product]
    let categories, banners: [String]
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let name, category, itemDescription, image: String
    var price: Int
}
