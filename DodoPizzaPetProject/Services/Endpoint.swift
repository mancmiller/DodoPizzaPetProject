//
//  Endpoint.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 29.06.2023.
//

import Foundation

protocol Endpoint {
    
    var sheme: String { get }
    
    var baseURL: String { get }
    
    var path: String { get }
    
    var parameters: [URLQueryItem] { get }
    
    var method: String { get }

}
