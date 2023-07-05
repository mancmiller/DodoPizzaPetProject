//
//  API.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 29.06.2023.
//

import Foundation

enum APIError: Error {
    case urlNotCreated
    var description: String {
        switch self {
        case .urlNotCreated:
            return "Error: failed to fetch url"
        }
    }
}

class API {
    class func request<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T {
        
        var components = URLComponents()
        components.scheme = endpoint.sheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        
        components.queryItems = endpoint.parameters
        
        guard let url = components.url else {
            throw APIError.urlNotCreated
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let response = try JSONDecoder().decode(responseModel, from: data)
            
            return response
        } catch {
            print(error)
            throw error
        }
    }
}
