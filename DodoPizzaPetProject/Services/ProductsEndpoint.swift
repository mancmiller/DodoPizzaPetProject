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
            return "/v3/527b1cf1-a919-4059-ab4a-89e96f9f662c"
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
