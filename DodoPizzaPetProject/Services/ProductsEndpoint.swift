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
            return "/v3/3f71390e-889a-4dd3-81b8-32c20817ee97"
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
