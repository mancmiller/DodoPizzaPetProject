//
//  ProductsEndpoint.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 29.06.2023.
//

import Foundation

enum ProductsEndpoint: Endpoint {
    
    case fetchProducts
    
    var sheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "run.mocky.io"
        }
    }
    
    var path: String {
        switch self {
        case .fetchProducts:
            return "/v3/69e03084-db49-425d-a8ef-51700558ede9"
        }
    }
    
    var parameters: [URLQueryItem] { return [] }
    
    var method: String {
        switch self {
        case .fetchProducts:
            return "GET"
        }
    }
}
